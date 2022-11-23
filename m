Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECCE6359A2
	for <lists+linux-stm32@lfdr.de>; Wed, 23 Nov 2022 11:23:44 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E6FABC6506F;
	Wed, 23 Nov 2022 10:23:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4A458C03FC9
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 23 Nov 2022 10:23:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AN7WZj9023248; Wed, 23 Nov 2022 11:23:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=aRGfu+c5NaAQpXxdGToTual+Y1cMXTMKRyYCCxqaSnA=;
 b=fBuW5mmsENRNR7Ols/4jy4lj5nI9caW2YRQRtJ7shebyi9f7yzjxJJ2VQqK6r9yFUAS3
 EbzlvZJOm+wFfa+gG+TFwboWpP+dNKTYGJy2YjMdnY+otlo9l/e4WLyVeie/rqRzz238
 MADGVohZdNQgM4Hd1XBQ0gvbZUHMBptGdOR7eB1JFOSXoa85+4JlM+hFBFGCIgSGvoen
 8mBCmHefIIl1pBp3yecQpgoxVTvYDgsEKRImGTjLKq85Hc9YSqaHxOHJmHpgCqkBhnXU
 u8cNuEFNO98aN2DQi22uKyaNyTzg9BgUbHgf3VOPq9O/rmzPKaCcIEz8ICX5vyOMoVSc qw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3m10c4dr6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Nov 2022 11:23:24 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8562B100034;
 Wed, 23 Nov 2022 11:23:18 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DF75218CFF;
 Wed, 23 Nov 2022 11:23:18 +0100 (CET)
Received: from [10.48.1.102] (10.48.1.102) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.13; Wed, 23 Nov
 2022 11:23:15 +0100
Message-ID: <b474ef48-f77b-807b-ce12-f5a200459933@foss.st.com>
Date: Wed, 23 Nov 2022 11:23:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20221115111347.3705732-1-u.kleine-koenig@pengutronix.de>
 <20221115111347.3705732-5-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20221115111347.3705732-5-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.48.1.102]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_04,2022-11-23_01,2022-06-22_01
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 4/5] pwm: stm32-lp: Use regmap_clear_bits
 and regmap_set_bits where applicable
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

T24gMTEvMTUvMjIgMTI6MTMsIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEZvdW5kIHVzaW5n
IGNvY2NpbmVsbGUgYW5kIHRoZSBmb2xsb3dpbmcgc2VtYW50aWMgcGF0Y2g6Cj4gCj4gQEAKPiBl
eHByZXNzaW9uIG1hcCwgcmVnLCBiaXRzOwo+IEBACj4gCj4gLSByZWdtYXBfdXBkYXRlX2JpdHMo
bWFwLCByZWcsIGJpdHMsIGJpdHMpCj4gKyByZWdtYXBfc2V0X2JpdHMobWFwLCByZWcsIGJpdHMp
Cj4gCj4gQEAKPiBleHByZXNzaW9uIG1hcCwgcmVnLCBiaXRzOwo+IEBACj4gCj4gLSByZWdtYXBf
dXBkYXRlX2JpdHMobWFwLCByZWcsIGJpdHMsIDApCj4gKyByZWdtYXBfY2xlYXJfYml0cyhtYXAs
IHJlZywgYml0cykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVp
bmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc3RtMzIt
bHAuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgYi9k
cml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYwo+IGluZGV4IDMxMTVhYmIzZjUyYS4uMjEyYmRjN2Q1
MWVlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi1scC5jCj4gKysrIGIvZHJp
dmVycy9wd20vcHdtLXN0bTMyLWxwLmMKPiBAQCAtMTQwLDkgKzE0MCw4IEBAIHN0YXRpYyBpbnQg
c3RtMzJfcHdtX2xwX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSwKPiAgCj4gIAlpZiAocmVlbmFibGUpIHsKPiAgCQkvKiBTdGFydCBMUCB0aW1lciBp
biBjb250aW51b3VzIG1vZGUgKi8KPiAtCQlyZXQgPSByZWdtYXBfdXBkYXRlX2JpdHMocHJpdi0+
cmVnbWFwLCBTVE0zMl9MUFRJTV9DUiwKPiAtCQkJCQkgU1RNMzJfTFBUSU1fQ05UU1RSVCwKPiAt
CQkJCQkgU1RNMzJfTFBUSU1fQ05UU1RSVCk7Cj4gKwkJcmV0ID0gcmVnbWFwX3NldF9iaXRzKHBy
aXYtPnJlZ21hcCwgU1RNMzJfTFBUSU1fQ1IsCj4gKwkJCQkgICAgICBTVE0zMl9MUFRJTV9DTlRT
VFJUKTsKCkhpIFV3ZSwKCk9uZSBtaW5vciBzdWdnZXN0aW9uIGhlcmU6IGNvdWxkIGZpdCBpbnRv
IGEgc2luZ2xlIGxpbmUuCgpZb3UgY2FuIGFkZCBteToKVGVzdGVkLWJ5OiBGYWJyaWNlIEdhc25p
ZXIgPGZhYnJpY2UuZ2FzbmllckBmb3NzLnN0LmNvbT4KCkJlc3QgUmVnYXJkcywKVGhhbmtzCkZh
YnJpY2UKCj4gIAkJaWYgKHJldCkgewo+ICAJCQlyZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBT
VE0zMl9MUFRJTV9DUiwgMCk7Cj4gIAkJCWdvdG8gZXJyOwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgt
c3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4u
c3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
