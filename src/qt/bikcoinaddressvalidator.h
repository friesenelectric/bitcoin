// Copyright (c) 2011-2014 The Bikcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BIKCOIN_QT_BIKCOINADDRESSVALIDATOR_H
#define BIKCOIN_QT_BIKCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class BikcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BikcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Bikcoin address widget validator, checks for a valid bikcoin address.
 */
class BikcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit BikcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // BIKCOIN_QT_BIKCOINADDRESSVALIDATOR_H
