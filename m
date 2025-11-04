Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16BC319B1
	for <lists+linux-stm32@lfdr.de>; Tue, 04 Nov 2025 15:48:27 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D0534C62ED4;
	Tue,  4 Nov 2025 14:48:26 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2CAE3C62ECF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  4 Nov 2025 14:48:25 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-891208f6185so520792785a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 04 Nov 2025 06:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762267704; x=1762872504;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TYbk9wPxk/JA4+MxrrdLZ/GfKAsrpCoWC70+eUl4rp4=;
 b=ke1vfwFlb53cGVzbmpymBOSNcFdNiqdG1nMdMDvxc0wcDyqX5Qp+5OlY0cLUW2NFc/
 Qh2RdCCzqPDf5TSHVSJDiqTzd4bs5WMA6SHwTT0vFTLBwxtmoscYGqU+BqlLcFewi+oh
 7lGf6oFzMnGTxtzeUEx0YK5LYO8AlgKqnJsiDdq1btu5lhQmpk9UI9d3XXXtepA3OXN2
 v1M/5K/Sn7085O8AxQy8IlfOBmtflJatu+KmAqw3GM7UKOfDW1R9n1y/WzvYdzup1ZAa
 UsEBFR0JrU29beZDEfCW8rLZgxLuDAiTwuGUHWhJVxwaR+qZJiKNsa/YEBPOHHeCDFaB
 kagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762267704; x=1762872504;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TYbk9wPxk/JA4+MxrrdLZ/GfKAsrpCoWC70+eUl4rp4=;
 b=ktKeP+mMq3FQnkb2VzqypduV7kiE+fZXW001CreeBCBL9JDz+A4A6lgIFYhvBbRiu8
 lzdyW6Df5Co4Ga7HbrHKKUypHH8009I2nEsfT5AOTxmNINqSBF8hiEjr11KRJQuaLrAX
 DIreb3pOJ/toiiPS8U1kwNi/UMqzgz2AGd5vX8HR8KeoI0I7koLuyQkdr/1z+6Li2ztk
 zndepnru4xL8OIjEwuIVvmeBGvehiUzvBIodRFCPD1rgkourKfbgnHXDTif/fQCKhx8y
 Zwwqw15rWIWr1OPsm/W/Xhal5xA4e7fj9e8T1HU1WbGQT/5+paHKoJF8zaWfCMSIaNyH
 NcNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe9cAYyuaI5tS1ui7LtJEf3WPURYrWoO1FYn4YPgpTd3+9li8yREY8LsKrTmr6f0LWCq/tHTUarxQ/MA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YzD25TVCQOiE9THRNzVIHNCoZTpk72PKlqz6i/AR9EfvqqJxLB6
 GOZNDzfc7V3XxKx/qDI9NZoYej7uhQoYK/fYgwL0d/T0efofojbRAygS
X-Gm-Gg: ASbGncvCSF34ZDe4Sud24bblLxaikJZTELtcBQa8CWxXKgi171aj7BGAj4JzYGdJYh9
 hTYiS5gOfmubaCoWwgxPXl3r5gofT6F7azsiUof5093eVo0kyuZJ8huvc1vByreon3exR6mkQ+t
 8MWALLr0gP7m9m/lKl299d3YzwnbYnHelZ1mNk7WbTTbO2l0joFy8oONCO9dZQSG0HzZ4BOaMnw
 OW40HGo5LF5NEt1VrOy3ZKPGjjD99BGedb13yeXdFYUFB30R6A6a2VVbqt8AtyFOq/GifRsRbsz
 GZk1PWrFN1tt3GK1rqk9/MmxTvmm3/ozsandKIwbaq8m5g+7HLeAVlOorL2TQ7wdqiJIrM3GxSr
 lNcCzN0Cdb8tAetT1ncxHLK/kCY1OrBXoQ6onzA2ohqy2KhDFqzfDBxa66mZIfPzGlILupRmPbi
 tGHVX/8z3jrWxEzzvADdakWaG/wZU1dCaG208wqaCgo2m7N6pqcL9EzKjnJjwW7RJC+Q==
X-Google-Smtp-Source: AGHT+IGmraHbZP2E2iRwXxMxNgGXM9zhZedCgpJV66vhLBH8PzAO8Dn4btILshzP2e0cEKgwNzEvBA==
X-Received: by 2002:a05:620a:1a27:b0:886:173f:1b4c with SMTP id
 af79cd13be357-8ab9ba6fd3emr1982205785a.80.1762267703489; 
 Tue, 04 Nov 2025 06:48:23 -0800 (PST)
Received: from ?IPV6:2600:4040:93b8:5f00:52dd:c164:4581:b7eb?
 ([2600:4040:93b8:5f00:52dd:c164:4581:b7eb])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b0f543d90csm198693785a.17.2025.11.04.06.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Nov 2025 06:48:23 -0800 (PST)
Message-ID: <78db1fab-e482-4ebc-82ce-ba84b3f561e2@gmail.com>
Date: Tue, 4 Nov 2025 09:48:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiri Pirko <jiri@resnulli.us>
References: <20251103194554.3203178-1-daniel.zahka@gmail.com>
 <20251103194554.3203178-3-daniel.zahka@gmail.com>
 <mhm4hkz52gmqok56iuiukdcz2kaowvppbqrfi3zxuq67p3otit@5fhpgu2axab2>
 <db5c46b4-cc66-48bb-aafb-40d83dd3620c@gmail.com>
 <6aa2f011-3ba5-4614-950d-d8f0ec62222b@gmail.com>
 <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
Content-Language: en-US
From: Daniel Zahka <daniel.zahka@gmail.com>
In-Reply-To: <p3pj3mu4mabgninwowqikegeotxgzhc4yptf7qrfhns37bnkoz@ugkbgvlkxqxb>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
 Brett Creeley <brett.creeley@amd.com>, Dave Ertman <david.m.ertman@intel.com>,
 linux-doc@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Jerin Jacob <jerinj@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>,
 linux-stm32@st-md-mailman.stormreply.com, Linu Cherian <lcherian@marvell.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Leon Romanovsky <leon@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Srujana Challa <schalla@marvell.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
 Bharat Bhushan <bbhushan2@marvell.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sunil Goutham <sgoutham@marvell.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 Roger Quadros <rogerq@kernel.org>,
 "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>,
 Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
 Michael Chan <michael.chan@broadcom.com>, linux-omap@vger.kernel.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, linux-arm-kernel@lists.infradead.org,
 Petr Machata <petrm@nvidia.com>, Manish Chopra <manishc@marvell.com>,
 netdev@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mark Bloch <mbloch@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 hariprasad <hkelam@marvell.com>, Simon Horman <horms@kernel.org>,
 Pavan Chebbi <pavan.chebbi@broadcom.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>, Vladimir Oltean <olteanv@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Geetha sowjanya <gakula@marvell.com>,
 Vlad Dumitrescu <vdumitrescu@nvidia.com>
Subject: Re: [Linux-stm32] [PATCH net-next v2 2/2] net/mlx5: implement
 swp_l4_csum_mode via devlink params
X-BeenThere: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-stm32.st-md-mailman.stormreply.com>
List-Unsubscribe: <https://st-md-mailman.stormreply.com/mailman/options/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=unsubscribe>
List-Archive: <http://st-md-mailman.stormreply.com/pipermail/linux-stm32/>
List-Post: <mailto:linux-stm32@st-md-mailman.stormreply.com>
List-Help: <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=help>
List-Subscribe: <https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32>, 
 <mailto:linux-stm32-request@st-md-mailman.stormreply.com?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

CgpPbiAxMS80LzI1IDk6MzkgQU0sIEppcmkgUGlya28gd3JvdGU6Cj4gVHVlLCBOb3YgMDQsIDIw
MjUgYXQgMDE6NTE6MTZQTSArMDEwMCwgZGFuaWVsLnphaGthQGdtYWlsLmNvbSB3cm90ZToKPj4K
Pj4gT24gMTEvNC8yNSA2OjM4IEFNLCBEYW5pZWwgWmFoa2Egd3JvdGU6Cj4+Pgo+Pj4gT24gMTEv
NC8yNSA1OjE0IEFNLCBKaXJpIFBpcmtvIHdyb3RlOgo+Pj4+IEkgZGlkIHNvbWUgcmVzZWFyY2gu
IDAvREVWSUNFX0RFRkFVTFQgc2hvdWxkIG5vdCBiZSBldmVyIHJlcG9ydGVkIGJhY2sKPj4+PiBm
cm9tIEZXLiBJdCdzIHB1cnBvc2UgaXMgZm9yIHVzZXIgdG8gcmVzZXQgdG8gZGVmYXVsdCBGVyBj
b25maWd1cmF0aW9uLgo+Pj4+IFdoYXQncyB0aGUgdXNlY2FzZSBmb3IgdGhhdD8gSSB0aGluayB5
b3UgY291bGQganVzdCBhdm9pZAo+Pj4+IDAvREVWSUNFX0RFRkFVTFQgZW50aXJlbHksIGZvciBi
b3RoIGdldCBhbmQgc2V0Lgo+Pj4gSSBmaW5kIHRoYXQgMC9ERVZJQ0VfREVGQVVMVCBpcyByZXBv
cnRlZCBiYWNrIG9uIG15IGRldmljZS4gSSBoYXZlCj4+PiBvYnNlcnZlZCB0aGlzIHNhbWUgYmVo
YXZpb3Igd2hlbiB1c2luZyB0aGUgbXN0Y29uZmlnIHRvb2wgZm9yIHNldHRpbmcgdGhlCj4+PiBw
YXJhbWV0ZXIgdG9vLgo+PiBlLmcuCj4+ICQgZG1lc2cgfCBncmVwIC1pIG1seCB8IGdyZXAgLWkg
ZmlybXdhcmUKPj4gW8KgIMKgMTAuMTY1NzY3XSBtbHg1X2NvcmUgMDAwMDowMTowMC4wOiBmaXJt
d2FyZSB2ZXJzaW9uOiAyOC40Ni4xMDA2Cj4+Cj4+ICQgLi9tc3Rjb25maWcgLWQgMDE6MDAuMCAt
YiAuL21seGNvbmZpZ19ob3N0LmRiIHF1ZXJ5IFNXUF9MNF9DSEVDS1NVTV9NT0RFCj4+Cj4+IERl
dmljZSAjMToKPj4gLS0tLS0tLS0tLQo+Pgo+PiBEZXZpY2UgdHlwZTrCoCDCoCDCoCDCoCBDb25u
ZWN0WDcKPj4gTmFtZTrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoENYNzExNDNETUMtQ0RBRV9GQl9B
eAo+PiBEZXNjcmlwdGlvbjrCoCDCoCDCoCDCoCBDb25uZWN0WC03IEV0aGVybmV0IGFkYXB0ZXIg
Y2FyZDsgMTAwIEdiRSBPQ1AzLjA7Cj4+IFNpbmdsZS1wb3J0IFFTRlA7IE11bHRpIEhvc3Q7IDIg
SG9zdDsgUENJZSA0LjAgeDE2OyBDcnlwdG8gYW5kIFNlY3VyZSBCb290Cj4+IERldmljZTrCoCDC
oCDCoCDCoCDCoCDCoCDCoDAxOjAwLjAKPj4KPj4gQ29uZmlndXJhdGlvbnM6wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgTmV4dCBC
b290Cj4+ICDCoCDCoCDCoCDCoCBTV1BfTDRfQ0hFQ0tTVU1fTU9ERSBERVZJQ0VfREVGQVVMVCgw
KQo+IFRoaXMgaXMgbmV4dC1ib290IHZhbHVlLiBZb3Ugc2hvdWxkIHF1ZXJ5IGN1cnJlbnQgKC0t
ZW5hYmxlX3ZlcmJvc2l0eSkKPiB0byBzaG93IGluIHBhcmFtIGdldC4KCkkgYW0gc3RpbGwgc2Vl
aW5nIHRoYXQgREVWSUNFX0RFRkFVTFQoMCkgaXMgcmVhZCBiYWNrOgoKJCAuL21zdGNvbmZpZyAt
LWVuYWJsZV92ZXJib3NpdHkgLWQgMDE6MDAuMCAtYiAuL21seGNvbmZpZ19ob3N0LmRiIHF1ZXJ5
IApTV1BfTDRfQ0hFQ0tTVU1fTU9ERQoKRGV2aWNlICMxOgotLS0tLS0tLS0tCgpEZXZpY2UgdHlw
ZTrCoCDCoCDCoCDCoCBDb25uZWN0WDcKTmFtZTrCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoENYNzEx
NDNETUMtQ0RBRV9GQl9BeApEZXNjcmlwdGlvbjrCoCDCoCDCoCDCoCBDb25uZWN0WC03IEV0aGVy
bmV0IGFkYXB0ZXIgY2FyZDsgMTAwIEdiRSBPQ1AzLjA7IApTaW5nbGUtcG9ydCBRU0ZQOyBNdWx0
aSBIb3N0OyAyIEhvc3Q7IFBDSWUgNC4wIHgxNjsgQ3J5cHRvIGFuZCBTZWN1cmUgQm9vdApEZXZp
Y2U6wqAgwqAgwqAgwqAgwqAgwqAgwqAwMTowMC4wCgpDb25maWd1cmF0aW9uczrCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBEZWZhdWx0wqAgwqAgwqAgwqAgwqAgwqAgwqBDdXJyZW50IMKgIMKg
IMKgIE5leHQgQm9vdAogwqAgwqAgwqAgwqAgU1dQX0w0X0NIRUNLU1VNX01PREUgREVWSUNFX0RF
RkFVTFQoMCkgREVWSUNFX0RFRkFVTFQoMCnCoCDCoCAKREVWSUNFX0RFRkFVTFQoMCkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1h
aWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBz
Oi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0
bTMyCg==
