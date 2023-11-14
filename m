Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B77EB0D1
	for <lists+linux-stm32@lfdr.de>; Tue, 14 Nov 2023 14:26:51 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1FDEC6B44B;
	Tue, 14 Nov 2023 13:26:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 62305C6A61A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 14 Nov 2023 13:26:50 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 3AEDN0vU025095; Tue, 14 Nov 2023 14:26:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=CDqcl3qizlmsvgyIJtirdFlv7IU9taiD9Ey6VLthwRE=; b=Oh
 npQaIjh4gMjm8jk76JXbItZteVmaqCbwKZt5Mudwu3QCkCFflqdH2ChRxCGlNKu+
 jW/hOHTg+geMEHQwUEJJ3xiHokDwIuxZp+OlJk2VU/4smxjFVDLWIWCGgeIJpcuK
 DIP/MHE+rOzS/Z6heQ0/3SLgkDvLuqJmwrmohUDi32ssGqTxu7NkAH9PPyY73SpI
 UDuvFPb/WzJYQvXryBwVeSaT1gR8NatG6RAH2eAkqR0HLm1hDsmcQIH6RC7cd5Qp
 +zk+5yPvdmBCxuRjfeX5XuD9mJd1/t/oExG/NBaoF+a0yllqWsZVP9iPRRzm7jZ4
 dSqGT7GYpabGNyLs/ihw==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3uam249hw9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Nov 2023 14:26:45 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 27477100038;
 Tue, 14 Nov 2023 14:26:45 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1F25C2122E6;
 Tue, 14 Nov 2023 14:26:45 +0100 (CET)
Received: from [10.201.20.59] (10.201.20.59) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 14 Nov
 2023 14:26:43 +0100
Message-ID: <617f2adf-5dec-4caf-b4d4-a706c0a83f31@foss.st.com>
Date: Tue, 14 Nov 2023 14:26:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20231019200658.1754190-7-u.kleine-koenig@pengutronix.de>
 <20231019200658.1754190-10-u.kleine-koenig@pengutronix.de>
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20231019200658.1754190-10-u.kleine-koenig@pengutronix.de>
X-Originating-IP: [10.201.20.59]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-14_13,2023-11-09_01,2023-05-22_02
Cc: kernel@pengutronix.de, linux-pwm@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 3/5] pwm: stm32: Use hweight32 in
 stm32_pwm_detect_channels
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

CgpPbiAxMC8xOS8yMyAyMjowNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRnJvbTogUGhp
bGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiAKPiBVc2UgaHdlaWdodDMyKCkg
dG8gY291bnQgdGhlIENDeEUgYml0cyBpbiBzdG0zMl9wd21fZGV0ZWN0X2NoYW5uZWxzKCkuCj4g
U2luY2UgdGhlIHJldHVybiB2YWx1ZSBpcyBhc3NpZ25lZCB0byBjaGlwLm5wd20sIGNoYW5nZSBp
dCB0byB1bnNpZ25lZAo+IGludCBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcHAg
WmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAtLS0KPiAgZHJpdmVy
cy9wd20vcHdtLXN0bTMyLmMgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKCkhpIFV3ZSwKCllvdSBjYW4gYWRk
IG15OgpSZXZpZXdlZC1ieTogRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5z
dC5jb20+CgpUaGFua3MsCkZhYnJpY2UKCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3
bS1zdG0zMi5jIGIvZHJpdmVycy9wd20vcHdtLXN0bTMyLmMKPiBpbmRleCAwMDlmOWMxYTVlY2Eu
LmNjNmNhZTA3YzAyYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc3RtMzIuYwo+ICsr
KyBiL2RyaXZlcnMvcHdtL3B3bS1zdG0zMi5jCj4gQEAgLTU2MywxMCArNTYzLDkgQEAgc3RhdGlj
IHZvaWQgc3RtMzJfcHdtX2RldGVjdF9jb21wbGVtZW50YXJ5KHN0cnVjdCBzdG0zMl9wd20gKnBy
aXYpCj4gIAlwcml2LT5oYXZlX2NvbXBsZW1lbnRhcnlfb3V0cHV0ID0gKGNjZXIgIT0gMCk7Cj4g
IH0KPiAgCj4gLXN0YXRpYyBpbnQgc3RtMzJfcHdtX2RldGVjdF9jaGFubmVscyhzdHJ1Y3Qgc3Rt
MzJfcHdtICpwcml2KQo+ICtzdGF0aWMgdW5zaWduZWQgaW50IHN0bTMyX3B3bV9kZXRlY3RfY2hh
bm5lbHMoc3RydWN0IHN0bTMyX3B3bSAqcHJpdikKPiAgewo+ICAJdTMyIGNjZXI7Cj4gLQlpbnQg
bnB3bSA9IDA7Cj4gIAo+ICAJLyoKPiAgCSAqIElmIGNoYW5uZWxzIGVuYWJsZSBiaXRzIGRvbid0
IGV4aXN0IHdyaXRpbmcgMSB3aWxsIGhhdmUgbm8KPiBAQCAtNTc2LDE5ICs1NzUsNyBAQCBzdGF0
aWMgaW50IHN0bTMyX3B3bV9kZXRlY3RfY2hhbm5lbHMoc3RydWN0IHN0bTMyX3B3bSAqcHJpdikK
PiAgCXJlZ21hcF9yZWFkKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsICZjY2VyKTsKPiAgCXJlZ21h
cF9jbGVhcl9iaXRzKHByaXYtPnJlZ21hcCwgVElNX0NDRVIsIFRJTV9DQ0VSX0NDWEUpOwo+ICAK
PiAtCWlmIChjY2VyICYgVElNX0NDRVJfQ0MxRSkKPiAtCQlucHdtKys7Cj4gLQo+IC0JaWYgKGNj
ZXIgJiBUSU1fQ0NFUl9DQzJFKQo+IC0JCW5wd20rKzsKPiAtCj4gLQlpZiAoY2NlciAmIFRJTV9D
Q0VSX0NDM0UpCj4gLQkJbnB3bSsrOwo+IC0KPiAtCWlmIChjY2VyICYgVElNX0NDRVJfQ0M0RSkK
PiAtCQlucHdtKys7Cj4gLQo+IC0JcmV0dXJuIG5wd207Cj4gKwlyZXR1cm4gaHdlaWdodDMyKGNj
ZXIgJiBUSU1fQ0NFUl9DQ1hFKTsKPiAgfQo+ICAKPiAgc3RhdGljIGludCBzdG0zMl9wd21fcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0CkxpbnV4LXN0
bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
