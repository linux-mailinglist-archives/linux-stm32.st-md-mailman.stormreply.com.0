Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D62337B705
	for <lists+linux-stm32@lfdr.de>; Wed, 12 May 2021 09:42:30 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B46D4C57B5B;
	Wed, 12 May 2021 07:42:29 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 45A4BC5718D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 12 May 2021 07:42:26 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14C7er8Y016608; Wed, 12 May 2021 09:42:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=mtmO0eRRDGX4r9MvsJBxMpxoqglzD6KV/FFApB5sBTk=;
 b=1Ppdff9rgy7E3SeQovPpydUQdPP8TacB+WXE7lwAJvQVPHfXrl7/MJl9lnYS5MHRSxY7
 UXIkHC4EXKpRgFmxQmSS48pmP6e9VNa7ZjYIQBRMCev06qZKiLBczma9lQl+qvAapan9
 sMQmplEVnu37oRz5bYsITVZUfu5gMiSs49OKdrBgI7uxdAEjKmlMhXrLon02nCyStLDY
 GMSvKcLsL3NLnut4Iqp5ji9PtXq1vxz6yRYkOt7zIHAuSVjtPNN4lrIwjsdmRVciCGwu
 De+zXQwzWjcYrTLB/feMqsIvwMvT5yhKypLisTETpjpSuOrw64zIx6XUGXcYBcKorZly fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 38fggpgec7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 09:42:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B727110002A;
 Wed, 12 May 2021 09:42:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5337212FCB;
 Wed, 12 May 2021 09:42:18 +0200 (CEST)
Received: from [10.211.1.115] (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 May
 2021 09:41:47 +0200
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Thierry Reding
 <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <1bd7cad8-723b-ec43-745c-0be32d105c0b@foss.st.com>
Date: Wed, 12 May 2021 09:41:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210505162843.188901-1-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_03:2021-05-11,
 2021-05-12 signatures=0
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@pengutronix.de
Subject: Re: [Linux-stm32] [PATCH 1/2] pwm: stm32-lp: Don't modify HW state
 in .remove callback
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

T24gNS81LzIxIDY6MjggUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOgo+IEEgY29uc3VtZXIg
aXMgZXhwZWN0ZWQgdG8gZGlzYWJsZSBhIFBXTSBiZWZvcmUgY2FsbGluZyBwd21fcHV0KCkuIEFu
ZCBpZgo+IHRoZXkgZGlkbid0IHRoZXJlIGlzIGhvcGVmdWxseSBhIGdvb2QgcmVhc29uIChvciB0
aGUgY29uc3VtZXIgbmVlZHMKPiBmaXhpbmcpLgoKSGkgVXdlLAoKQXMgeW91IHBvaW50ZWQgb3V0
LCAoaWRlYWxseSkgY29uc3VtZXJzIG5lZWQgdG8gZGlzYWJsZSB0aGUgUFdNIGJlZm9yZQp1bmRp
bmQgb3IgcmVtb3ZlIG9mIHRoZSBkcml2ZXIuIENhbGxpbmcgcHdtX2Rpc2FibGUgaW4gdGhlIHJl
bW92ZSBpcyBhCiJmYWlsIHNhZmUiLgoKPiBBbHNvIGlmIGRpc2FibGluZyBhbiBlbmFibGVkIFBX
TSB3YXMgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLAo+IHRoaXMgc2hvdWxkIGJldHRlciBiZSBkb25l
IGluIHRoZSBmcmFtZXdvcmsgaW5zdGVhZCBvZiBpbiBlYWNoIGxvdyBsZXZlbAo+IGRyaXZlci4K
Ck5vdCBkb2luZyBzbywgaW4gY2FzZSB0aGUgZHJpdmVyIGdldHMgdW5iaW5kIHdoZW4gdGhlIFBX
TSBpcyBlbmFibGVkLAp0aGVuIGJpbmQgYWdhaW4sIGl0IGxlYWRzIHRvIHVuYmFsYW5jZWQgY2xv
Y2sgZW5hYmxlIGNvdW50LgpUaGVyZSdzIG5vIGNoYW5nZSB0byByZWNvdmVyIHRoZSBiYWxhbmNl
IGFmdGVyIGl0LgoKQWxzbywgSSdtIGFsc28gd29uZGVyaW5nIGlmIGl0J3MgYSBnb29kIGlkZWEg
dG8gbGV0IGEgZnJlZSBydW5uaW5nIFBXTQpjaGFubmVsPyAoVGhhdCdzIHByb2JhYmx5IGEgbW9y
ZSBnZW5lcmFsIGRpc2N1c3Npb24pLgoKPiAKPiBTbyBkcm9wIHRoZSBoYXJkd2FyZSBtb2RpZmlj
YXRpb24gZnJvbSB0aGUgLnJlbW92ZSgpIGNhbGxiYWNrLgoKRm9yIG5vdywgSSdkIHByZWZlciB0
byBrZWVwIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBlLmcuIG5vdCB0bwpzaW1wbHkgZHJv
cCB0aGlzIGZhaWwgc2FmZS4KCklzIHRoZXJlIGEgcmVhc29uIHRvIGFkZHJlc3Mgb25seSB0aGUg
U1RNMzIgTFAgVGltZXIgcHdtIGRyaXZlciBpbiB5b3VyCnBhdGNoID8KKEkgc2VlIHRoZXJlIGFy
ZSBvdGhlciBkcml2ZXJzIGFyb3VuZCwgZG9pbmcgdGhlIHNhbWUuIEkgYWdyZWUgdGhpcwpjb3Vs
ZCBiZXR0ZXIgYmUgYWRkcmVzc2VkIGJ5IHRoZSBmcmFtZXdvcmssIGZvciBhbGwgZHJpdmVycyku
CgpCZXN0IFJlZ2FyZHMsCkZhYnJpY2UKCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMgfCAyIC0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyBiL2RyaXZlcnMv
cHdtL3B3bS1zdG0zMi1scC5jCj4gaW5kZXggYWYwOGY1NjRlZjFkLi4yNDY0ZjdhMjQ5ODMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMKPiArKysgYi9kcml2ZXJzL3B3
bS9wd20tc3RtMzItbHAuYwo+IEBAIC0yMjQsOCArMjI0LDYgQEAgc3RhdGljIGludCBzdG0zMl9w
d21fbHBfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiAgCXN0cnVj
dCBzdG0zMl9wd21fbHAgKnByaXYgPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiAgCj4g
LQlwd21fZGlzYWJsZSgmcHJpdi0+Y2hpcC5wd21zWzBdKTsKPiAtCj4gIAlyZXR1cm4gcHdtY2hp
cF9yZW1vdmUoJnByaXYtPmNoaXApOwo+ICB9Cj4gIAo+IAo+IGJhc2UtY29tbWl0OiBhNmVmYjM1
MDE5ZDAwZjQ4M2EwZTVmMTg4NzQ3NzIzMzcxZDY1OWZlCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51
eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1h
bi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
