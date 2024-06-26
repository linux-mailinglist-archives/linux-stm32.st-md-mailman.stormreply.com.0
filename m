Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2951391871A
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jun 2024 18:16:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C09E9C71282;
	Wed, 26 Jun 2024 16:16:37 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 25BA9C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jun 2024 16:16:30 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QBLI8W023451;
 Wed, 26 Jun 2024 18:16:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 0K6g4n5PAuZsVsxr2X9hg3rFa4+lIJuxNGEgIloS7DY=; b=EyU3L10newAuzHTN
 t+Bk/jwsZdFiq35Ki6JMbOWT/srmka8vs5v3dGLrPN1f2vgDh4bARIsJwKAPl1gD
 +byra0tGSKKY0YEIASQBi+4YhVB9fmx/YkP8zE+xfV7M8Z5bcfVz5uhbydJKwNO0
 rbJ1sc5LkcLyXL+c3laPCTd6jAS3TriBJPUqCt8U7llRbUxwJ71BQEXE9F1zLV3b
 EQ9IToEVMJJZjz25/NPeAq6ipKdJnU28mUh+eX8EORs/xWvYhPBYPm7fBxhpCI1p
 2gr1f701xzjpdKcazRMsEoUX/RcHq6s35/AB543kKUFoZsUxQ7nkCLe6VSvxfyM/
 myhAmw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yx9jjest7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jun 2024 18:16:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 633E340044;
 Wed, 26 Jun 2024 18:15:54 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C59B62291CA;
 Wed, 26 Jun 2024 18:15:16 +0200 (CEST)
Received: from [10.252.26.2] (10.252.26.2) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 26 Jun
 2024 18:15:16 +0200
Message-ID: <7125491f-880c-486e-b417-8fc1e0c20c88@foss.st.com>
Date: Wed, 26 Jun 2024 18:15:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>,
 <fabrice.gasnier@foss.st.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20240625150717.1038212-1-olivier.moysan@foss.st.com>
 <20240625150717.1038212-9-olivier.moysan@foss.st.com>
 <c2d746c73f7450dd10c0a0b229b3672e44fe583a.camel@gmail.com>
Content-Language: en-US
From: Olivier MOYSAN <olivier.moysan@foss.st.com>
In-Reply-To: <c2d746c73f7450dd10c0a0b229b3672e44fe583a.camel@gmail.com>
X-Originating-IP: [10.252.26.2]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
Cc: linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nuno Sa <nuno.sa@analog.com>
Subject: Re: [Linux-stm32] [PATCH v2 8/8] iio: adc: stm32-dfsdm: add scaling
 support to dfsdm
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

SGkgTnVubywKCk9uIDYvMjYvMjQgMTA6NTksIE51bm8gU8OhIHdyb3RlOgo+IEhpIE9saXZpZXIs
Cj4gCj4gT25lIHRoaW5nIHRoYXQgSSBqdXN0IG5vdGljZWQuLi4KPiAKPiBPbiBUdWUsIDIwMjQt
MDYtMjUgYXQgMTc6MDcgKzAyMDAsIE9saXZpZXIgTW95c2FuIHdyb3RlOgo+PiBBZGQgc2NhbGlu
ZyBzdXBwb3J0IHRvIFNUTTMyIERGU0RNLgo+Pgo+PiBXaGVuIHVzZWQgaW4gYW4gYW5hbG9nIGNv
bnRleHQsIGEgREZTRE0gZmlsdGVyIHR5cGljYWxseSBjb252ZXJ0cyB0aGUgZGF0YQo+PiBmcm9t
IGEgc2lnbWEgZGVsdGEgbW9kdWxhdG9yLiBUaGUgSUlPIGRldmljZSBhc3NvY2lhdGVkIHRvIHRo
ZSBERlNETQo+PiBmaWx0ZXIgcHJvdmlkZXMgdGhlc2UgZGF0YSBhcyByYXcgZGF0YS4KPj4gVGhl
IElJTyBkZXZpY2UgY2FuIHByb3ZpZGUgc2NhbGluZyBpbmZvcm1hdGlvbiAodm9sdGFnZSBhbmQg
b2Zmc2V0KSB0bwo+PiBhbGxvdyBjb252ZXJzaW9uIG9mIHJhdyBkYXRhIGludG8gcGh5c2ljYWwg
dmFsdWVzLgo+Pgo+PiBXaXRoIHRoZSBuZXcgYmluZGluZyBiYXNlZCBvbiBJSU8gYmFja2VuZCBm
cmFtZXdvcmssIHRoZSBzaWdtYSBkZWx0YQo+PiBtb2R1bGF0b3JzIGFyZSBkZWZpbmVkIGFzIGJh
Y2tlbmRzIHByb3ZpZGluZyBzY2FsaW5nIGluZm9ybWF0aW9uLgo+Pgo+PiBUaGUgc2NhbGluZyBp
cyBub3Qgc3VwcG9ydGVkIHdpdGggbGVnYWN5IGJpbmRpbmcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IE9saXZpZXIgTW95c2FuIDxvbGl2aWVyLm1veXNhbkBmb3NzLnN0LmNvbT4KPj4gQWNrZWQtYnk6
IE51bm8gU2EgPG51bm8uc2FAYW5hbG9nLmNvbT4KPj4gLS0tCj4+Cj4gCj4gLi4uCj4gCj4+ICsK
Pj4gKwljYXNlIElJT19DSEFOX0lORk9fU0NBTEU6Cj4+ICsJCS8qCj4+ICsJCSAqIFNjYWxlIGlz
IGV4cHJlc3NlZCBpbiBtVi4KPj4gKwkJICogV2hlbiBmYXN0IG1vZGUgaXMgZGlzYWJsZWQsIGFj
dHVhbCByZXNvbHV0aW9uIG1heSBiZSBsb3dlcgo+PiArCQkgKiB0aGFuIDJebiwgd2hlcmUgbiA9
IHJlYWxiaXRzIC0gMS4KPj4gKwkJICogVGhpcyBsZWFkcyB0byB1bmRlcmVzdGltYXRpbmcgdGhl
IGlucHV0IHZvbHRhZ2UuCj4+ICsJCSAqIFRvIGNvbXBlbnNhdGUgdGhpcyBkZXZpYXRpb24sIHRo
ZSB2b2x0YWdlIHJlZmVyZW5jZSBjYW4gYmUKPj4gKwkJICogY29ycmVjdGVkIHdpdGggYSBmYWN0
b3IgPSByZWFsYml0cyByZXNvbHV0aW9uIC8gYWN0dWFsIG1heAo+PiArCQkgKi8KPj4gKwkJaWYg
KGFkYy0+YmFja2VuZFtpZHhdKSB7Cj4+ICsJCQlpaW9fYmFja2VuZF9yZWFkX3JhdyhhZGMtPmJh
Y2tlbmRbaWR4XSwgY2hhbiwgdmFsLAo+PiB2YWwyLCBtYXNrKTsKPiAKPiBFdmUgaWYgaXQgZG9l
cyBub3QgbWF0dGVyIGZvciB5b3VyIHVzZWNhc2UsIHlvdSBzaG91bGQgc3RpbGwgZG8gZXJyb3Ig
aGFuZGxpbmcKPiBhcyBpaW9fYmFja2VuZF9yZWFkX3JhdygpIGNhbiByZXR1cm4gYW4gZXJyb3Iu
Cj4gCgpBY2suIE9uIHRoZSBzYW1lIG9jY2FzaW9uLCBJIHdpbGwgc3dpdGNoIHRvIGEgZGVkaWNh
dGVkIEFQSS4KCk9saXZpZXIKCj4+ICsJCQkqdmFsID0gZGl2X3U2NCgodTY0KSp2YWwgKiAodTY0
KUJJVChERlNETV9EQVRBX1JFUyAtCj4+IDEpLCBtYXgpOwo+PiArCQkJKnZhbDIgPSBjaGFuLT5z
Y2FuX3R5cGUucmVhbGJpdHM7Cj4+ICsJCQlpZiAoY2hhbi0+ZGlmZmVyZW50aWFsKQo+PiArCQkJ
CSp2YWwgKj0gMjsKPj4gKwkJfQo+PiArCQlyZXR1cm4gSUlPX1ZBTF9GUkFDVElPTkFMX0xPRzI7
Cj4+ICsKPj4gKwljYXNlIElJT19DSEFOX0lORk9fT0ZGU0VUOgo+PiArCQkvKgo+PiArCQkgKiBE
RlNETSBvdXRwdXQgZGF0YSBhcmUgaW4gdGhlIHJhbmdlIFstMl5uLCAyXm5dLAo+PiArCQkgKiB3
aXRoIG4gPSByZWFsYml0cyAtIDEuCj4+ICsJCSAqIC0gRGlmZmVyZW50aWFsIG1vZHVsYXRvcjoK
Pj4gKwkJICogT2Zmc2V0IGNvcnJlc3BvbmQgdG8gU0QgbW9kdWxhdG9yIG9mZnNldC4KPj4gKwkJ
ICogLSBTaW5nbGUgZW5kZWQgbW9kdWxhdG9yOgo+PiArCQkgKiBJbnB1dCBpcyBpbiBbMFYsIFZy
ZWZdIHJhbmdlLAo+PiArCQkgKiB3aGVyZSAwViBjb3JyZXNwb25kcyB0byAtMl5uLCBhbmQgVnJl
ZiB0byAyXm4uCj4+ICsJCSAqIEFkZCAyXm4gdG8gb2Zmc2V0LiAoaS5lLiBtaWRkbGUgb2YgaW5w
dXQgcmFuZ2UpCj4+ICsJCSAqIG9mZnNldCA9IG9mZnNldChzZCkgKiB2cmVmIC8gcmVzKHNkKSAq
IG1heCAvIHZyZWYuCj4+ICsJCSAqLwo+PiArCQlpZiAoYWRjLT5iYWNrZW5kW2lkeF0pIHsKPj4g
KwkJCWlpb19iYWNrZW5kX3JlYWRfcmF3KGFkYy0+YmFja2VuZFtpZHhdLCBjaGFuLCB2YWwsCj4+
IHZhbDIsIG1hc2spOwo+IAo+IFNhbWUuLi4KPiAKPiAtIE51bm8gU8OhCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlz
dApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQt
bWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
