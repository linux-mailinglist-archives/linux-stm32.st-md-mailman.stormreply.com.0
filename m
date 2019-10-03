Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4939C9BAC
	for <lists+linux-stm32@lfdr.de>; Thu,  3 Oct 2019 12:06:03 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 90F5CC36B0B;
	Thu,  3 Oct 2019 10:06:03 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id DF7ECC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  3 Oct 2019 10:06:01 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x93A1X0C005362; Thu, 3 Oct 2019 12:05:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=/wp1iPbxskdZoxALyqazsiyERNct5sj1Muer0F1tD74=;
 b=fnDbHZBC7gucaOq1OwiWvpk9mi5otnSna/X8G/DRKg97jhqQR+ap1O2bayscHekH9JBM
 z0qOfV6rZfg7gci5/bRttu8mkYRScTYbXp09AJid7ej1V8bXYpIaxxBaH5dwE5GtW59h
 Rhqztw09BN6gGMpoJirZh0XhjZpM9oN+Al2N46HtdrO5zA21+68yPBIQBww2wgmOiKMt
 o1f+9hgtzWQOai55THnJxEHM6yt9N/xEPLYxZXyeTaYDcNVN+ECzv3xp2ztZRwgODHQh
 MlcquGFHPBEpEUkdcqDZ+TqY/thYM37QSxZAiX2PMfbzYEmvupvHrNlsFBv2svFyRT/5 +g== 
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com with ESMTP id 2vcem38t31-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Thu, 03 Oct 2019 12:05:51 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 931DA4D;
 Thu,  3 Oct 2019 10:05:47 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4AF6C2B5CAA;
 Thu,  3 Oct 2019 12:05:47 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 3 Oct
 2019 12:05:46 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Thu, 3 Oct 2019 12:05:47 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: Alexandre TORGUE <alexandre.torgue@st.com>, Jonathan Corbet
 <corbet@lwn.net>
Thread-Topic: [PATCH] Documentation: add link to stm32mp157 docs
Thread-Index: AQHVXNGu+WgWi0gJwE+sfJwWkTflzacPHSFxgDnL12A=
Date: Thu, 3 Oct 2019 10:05:46 +0000
Message-ID: <8d097a0486e94257952600bf6d20975d@SFHDAG5NODE1.st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
 <20190827074825.64a28e88@lwn.net>
 <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
In-Reply-To: <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.44]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-03_04:2019-10-01,2019-10-03 signatures=0
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

SGkgSm9uYXRoYW4NCg0KPiBGcm9tOiBBbGV4YW5kcmUgVE9SR1VFIDxhbGV4YW5kcmUudG9yZ3Vl
QHN0LmNvbT4NCj4gSGkgSm9uYXRoYW4sDQo+IA0KPiBPbiA4LzI3LzE5IDM6NDggUE0sIEpvbmF0
aGFuIENvcmJldCB3cm90ZToNCj4gPiBPbiBUdWUsIDI3IEF1ZyAyMDE5IDEyOjE5OjMyICswMDAw
DQo+ID4gR2VyYWxkIEJBRVpBIDxnZXJhbGQuYmFlemFAc3QuY29tPiB3cm90ZToNCj4gPg0KPiA+
PiBMaW5rIHRvIHRoZSBvbmxpbmUgc3RtMzJtcDE1NyBkb2N1bWVudGF0aW9uIGFkZGVkIGluIHRo
ZSBvdmVydmlldy4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogR2VyYWxkIEJhZXphIDxnZXJh
bGQuYmFlemFAc3QuY29tPg0KPiA+PiAtLS0NCj4gPj4gICBEb2N1bWVudGF0aW9uL2FybS9zdG0z
Mi9zdG0zMm1wMTU3LW92ZXJ2aWV3LnJzdCB8IDYgKysrKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcm0vc3RtMzIvc3RtMzJtcDE1Ny1vdmVydmlldy5yc3QNCj4gPj4gYi9Eb2N1bWVudGF0aW9u
L2FybS9zdG0zMi9zdG0zMm1wMTU3LW92ZXJ2aWV3LnJzdA0KPiA+PiBpbmRleCBmNjJmZGM4Li44
ZDVhNDc2IDEwMDY0NA0KPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FybS9zdG0zMi9zdG0zMm1w
MTU3LW92ZXJ2aWV3LnJzdA0KPiA+PiArKysgYi9Eb2N1bWVudGF0aW9uL2FybS9zdG0zMi9zdG0z
Mm1wMTU3LW92ZXJ2aWV3LnJzdA0KPiA+PiBAQCAtMTQsNiArMTQsMTIgQEAgSXQgZmVhdHVyZXM6
DQo+ID4+ICAgLSBTdGFuZGFyZCBjb25uZWN0aXZpdHksIHdpZGVseSBpbmhlcml0ZWQgZnJvbSB0
aGUgU1RNMzIgTUNVIGZhbWlseQ0KPiA+PiAgIC0gQ29tcHJlaGVuc2l2ZSBzZWN1cml0eSBzdXBw
b3J0DQo+ID4+DQo+ID4+ICtSZXNvdXJjZXMNCj4gPj4gKy0tLS0tLS0tLQ0KPiA+PiArDQo+ID4+
ICtEYXRhc2hlZXQgYW5kIHJlZmVyZW5jZSBtYW51YWwgYXJlIHB1YmxpY2x5IGF2YWlsYWJsZSBv
biBTVCB3ZWJzaXRlOg0KPiA+PiArLi4gX1NUTTMyTVAxNTc6DQo+ID4+ICtodHRwczovL3d3dy5z
dC5jb20vZW4vbWljcm9jb250cm9sbGVycy0NCj4gbWljcm9wcm9jZXNzb3JzL3N0bTMybXAxNTcu
aHQNCj4gPj4gK21sDQo+ID4+ICsNCj4gPg0KPiA+IEFkZGluZyB0aGUgVVJMIGlzIGEgZmluZSBp
ZGVhLiAgQnV0IHlvdSBkb24ndCBuZWVkIHRoZSBleHRyYSBzeW50YXggdG8NCj4gPiBjcmVhdGUg
YSBsaW5rIGlmIHlvdSdyZSBub3QgZ29pbmcgdG8gYWN0dWFsbHkgbWFrZSBhIGxpbmsgb3V0IG9m
IGl0Lg0KPiA+IFNvIEknZCB0YWtlIHRoZSAiLi4gX1NUTTMyTVAxNTc6IiBwYXJ0IG91dCBhbmQg
bGlmZSB3aWxsIGJlIGdvb2QuDQo+ID4NCj4gDQo+IFdlIGFsc28gZGlkIGl0IGZvciBvbGRlciBz
dG0zMiBwcm9kdWN0LiBJZGVhIHdhcyB0byBub3QgaGF2ZSB0aGUgImZ1bGwiDQo+IGFkZHJlc3Mg
YnV0IGp1c3QgYSBzaG9ydGN1dCBvZiB0aGUgbGluayB3aGVuIGh0bWwgZmlsZSBpcyByZWFkLiBJ
dCBtYXliZSBtYWtlcw0KPiBubyBzZW5zID8gKGlmIHllcyB3ZSB3aWxsIGhhdmUgdG8gdXBkYXRl
IG9sZGVyIHN0bTMyIG92ZXJ2aWV3IDopKQ0KDQpFeGFtcGxlIGluIGh0dHBzOi8vd3d3Lmtlcm5l
bC5vcmcvZG9jL2h0bWwvbGF0ZXN0L2FybS9zdG0zMi9zdG0zMmg3NDMtb3ZlcnZpZXcuaHRtbA0K
DQpEbyB5b3UgYWdyZWUgdG8gY29udGludWUgbGlrZSB0aGlzID8NCg0KQmVzdCByZWdhcmRzLA0K
DQpHw6lyYWxkDQoNCj4gdGhhbmtzDQo+IEFsZXgNCj4gDQo+IA0KPiA+IFRoYW5rcywNCj4gPg0K
PiA+IGpvbg0KPiA+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5z
dG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1h
bi9saXN0aW5mby9saW51eC1zdG0zMgo=
