Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 7473C2C2972
	for <lists+linux-stm32@lfdr.de>; Tue, 24 Nov 2020 15:26:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2F990C56630;
	Tue, 24 Nov 2020 14:26:10 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 90498C32EA7
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 24 Nov 2020 14:26:08 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0AOEGZiR017030; Tue, 24 Nov 2020 15:24:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=/Lr2yKdeXEPI/ALwJxE9iloE/mG9CzbQupaWiqLE3wM=;
 b=G38+FG9jP/010Etf8q+4RN8sdlaTwcdjAdhjhmB9/fagRQTrGL4phffCwVXN7RkYUrEF
 AKkoUw57L0qtNJZIU3nJCYOMXt71Rw9WVgD2ZX4dpd/7uq5B5zmLqOIu7RRyFbcYJnCg
 R6QrqiX3rltVYf44Vys7ThcAQjaCYaR1BGzjwCexgHqc/xkKAWkxBtLaxXtQ0aUFlIti
 ZGpAY31DgioYTOVnkpxbR7VhdfA1TcjznugPG1Lm2C+aGYFaInoJkZQH0lMXuD9PxbVU
 VeyyRuP0jgnqvDtv3exNGj96b6CunQNT2nInKWBHy8x+NXFWgv6Db5xtiz+OLvtkg+us qg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34y0fgsrnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 Nov 2020 15:24:19 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E17DD10002A;
 Tue, 24 Nov 2020 15:24:18 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag1node3.st.com [10.75.127.3])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9045E2B8A38;
 Tue, 24 Nov 2020 15:24:18 +0100 (CET)
Received: from [10.129.7.42] (10.75.127.48) by SFHDAG1NODE3.st.com
 (10.75.127.3) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 24 Nov
 2020 15:24:15 +0100
Message-ID: <e2b2b623700401538fe91e70495c348c08b5d2e3.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Jakub Kicinski
 <jakub.kicinski@netronome.com>
Date: Tue, 24 Nov 2020 15:23:27 +0100
In-Reply-To: <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
References: <20191007154306.95827-1-antonio.borneo@st.com>
 <20191007154306.95827-5-antonio.borneo@st.com>
 <20191009152618.33b45c2d@cakuba.netronome.com>
 <42960ede-9355-1277-9a6f-4eac3c22365c@pengutronix.de>
User-Agent: Evolution 3.38.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG1NODE3.st.com
 (10.75.127.3)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-24_04:2020-11-24,
 2020-11-24 signatures=0
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, has <has@pengutronix.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S.
 Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] net: stmmac: add flexible PPS to dwmac
	4.10a
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

T24gVHVlLCAyMDIwLTExLTI0IGF0IDE1OjE1ICswMTAwLCBBaG1hZCBGYXRvdW0gd3JvdGU6Cj4g
SGVsbG8gSmFrdWIsCj4gCj4gT24gMTAuMTAuMTkgMDA6MjYsIEpha3ViIEtpY2luc2tpIHdyb3Rl
Ogo+ID4gT24gTW9uLCA3IE9jdCAyMDE5IDE3OjQzOjA2ICswMjAwLCBBbnRvbmlvIEJvcm5lbyB3
cm90ZToKPiA+ID4gQWxsIHRoZSByZWdpc3RlcnMgYW5kIHRoZSBmdW5jdGlvbmFsaXRpZXMgdXNl
ZCBpbiB0aGUgY2FsbGJhY2sKPiA+ID4gZHdtYWM1X2ZsZXhfcHBzX2NvbmZpZygpIGFyZSBjb21t
b24gYmV0d2VlbiBkd21hYyA0LjEwYSBbMV0gYW5kCj4gPiA+IDUuMDBhIFsyXS4KPiA+ID4gCj4g
PiA+IFJldXNlIHRoZSBzYW1lIGNhbGxiYWNrIGZvciBkd21hYyA0LjEwYSB0b28uCj4gPiA+IAo+
ID4gPiBUZXN0ZWQgb24gU1RNMzJNUDE1eCwgYmFzZWQgb24gZHdtYWMgNC4xMGEuCj4gPiA+IAo+
ID4gPiBbMV0gRFdDIEV0aGVybmV0IFFvUyBEYXRhYm9vayA0LjEwYSBPY3RvYmVyIDIwMTQKPiA+
ID4gWzJdIERXQyBFdGhlcm5ldCBRb1MgRGF0YWJvb2sgNS4wMGEgU2VwdGVtYmVyIDIwMTcKPiA+
ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQm9ybmVvIDxhbnRvbmlvLmJvcm5lb0Bz
dC5jb20+Cj4gPiAKPiA+IEFwcGxpZWQgdG8gbmV0LW5leHQuCj4gCj4gVGhpcyBwYXRjaCBzZWVt
cyB0byBoYXZlIGJlZW4gZnV6emlseSBhcHBsaWVkIGF0IHRoZSB3cm9uZyBsb2NhdGlvbi4KPiBU
aGUgZGlmZiBkZXNjcmliZXMgZXh0ZW5zaW9uIG9mIGR3bWFjIDQuMTBhIGFuZCBzbyBkb2VzIHRo
ZSBAQCBsaW5lOgo+IAo+IMKgwqBAQCAtODY0LDYgKzg2NCw3IEBAIGNvbnN0IHN0cnVjdCBzdG1t
YWNfb3BzIGR3bWFjNDEwX29wcyA9IHsKPiAKPiBUaGUgcGF0Y2ggd2FzIGFwcGxpZWQgbWFpbmxp
bmUgYXMgNzU3OTI2MjQ3ODM2ICgibmV0OiBzdG1tYWM6IGFkZAo+IGZsZXhpYmxlIFBQUyB0byBk
d21hYyA0LjEwYSIpLCBidXQgaXQgZXh0ZW5kcyBkd21hYzRfb3BzIGluc3RlYWQ6Cj4gCj4gwqDC
oEBAIC05MzgsNiArOTM4LDcgQEAgY29uc3Qgc3RydWN0IHN0bW1hY19vcHMgZHdtYWM0X29wcyA9
IHsKPiAKPiBJIGRvbid0IGtub3cgaWYgZHdtYWM0IGFjdHVhbGx5IHN1cHBvcnRzIEZsZXhQUFMs
IHNvIEkgdGhpbmsgaXQncwo+IGJldHRlciB0byBiZSBvbiB0aGUgc2FmZSBzaWRlIGFuZCByZXZl
cnQgNzU3OTI2MjQ3ODM2IGFuZCBhZGQgdGhlCj4gY2hhbmdlIGZvciB0aGUgY29ycmVjdCB2YXJp
YW50LgoKQWdyZWUsCnRoZSBwYXRjaCBnZXQgYXBwbGllZCB0byB0aGUgd3JvbmcgcGxhY2UhCgpB
bnRvbmlvCgo+IAo+IENoZWVycywKPiBBaG1hZAo+IAo+IAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
