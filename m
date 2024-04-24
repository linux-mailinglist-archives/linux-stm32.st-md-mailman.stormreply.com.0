Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA6E8B0927
	for <lists+linux-stm32@lfdr.de>; Wed, 24 Apr 2024 14:21:36 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E1115C7128C;
	Wed, 24 Apr 2024 12:21:35 +0000 (UTC)
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 205FAC7128B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 24 Apr 2024 12:21:35 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43OC4omW029734;
 Wed, 24 Apr 2024 14:20:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=hkSUB26Hij3YoH4d4gONssMZiD9lhMIi9MYuoDahbc0=; b=oP
 BxCIqjZqjU5yIPdolezp3gucfYE43BpO2moF0boJpv1s74317nNrf8tTbYX5usOd
 rlKx/FhS1Qy6Jkjea82P6nnIhij2k6RtqQ72RGkfOKHZzW/rYU1jige7eN6glRBm
 Gr/fYnvQ0nI1FFIhwyV+FpQcOob58VqnssUOpcpR/bfBeTjXY5MTu8NY0VN5oLNt
 baPC6vo+Z6OwTORIZk9BIz6pJZyBiWpxinx+vs127hpTMIh3Q7+NTYQB11bqSkWu
 wTRZ/tTR1dd1WWC/yQviBRPlU7NtgpxHp9kyOZz9PzdXYOFqZatkp9e4ugAKrRJ2
 ZAcLVNQAQ/E+lH5KwgDw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xmrnj5npa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Apr 2024 14:20:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 16FD54002D;
 Wed, 24 Apr 2024 14:20:30 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0C4C621A91F;
 Wed, 24 Apr 2024 14:19:21 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 24 Apr
 2024 14:19:18 +0200
Message-ID: <a0bd94ce-3ddb-4448-ada9-7070323cc98f@foss.st.com>
Date: Wed, 24 Apr 2024 14:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Saravana Kannan <saravanak@google.com>, Gatien Chevallier
 <gatien.chevallier@foss.st.com>
References: <20240105130404.301172-1-gatien.chevallier@foss.st.com>
 <20240105130404.301172-7-gatien.chevallier@foss.st.com>
 <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <CAGETcx8HdnspNfDEJP+cqShJPsDryzGkOVq6B99cFQzkZi3dMg@mail.gmail.com>
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_10,2024-04-23_02,2023-05-22_02
Cc: ulf.hansson@linaro.org, linux-iio@vger.kernel.org, catalin.marinas@arm.com,
 alsa-devel@alsa-project.org, edumazet@google.com, Oleksii_Moisieiev@epam.com,
 krzysztof.kozlowski+dt@linaro.org, linux-phy@lists.infradead.org,
 will@kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 peng.fan@oss.nxp.com, Rob Herring <robh@kernel.org>, lars@metafoo.de,
 herbert@gondor.apana.org.au, Frank Rowand <frowand.list@gmail.com>,
 hugues.fruchet@foss.st.com, lee@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 wg@grandegger.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, andi.shyti@kernel.org, richardcochran@gmail.com,
 robh+dt@kernel.org, mkl@pengutronix.de, linux-serial@vger.kernel.org,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, arnd@kernel.org,
 rcsekar@samsung.com, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, vkoul@kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, davem@davemloft.net,
 jic23@kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v9 06/13] of: property: fw_devlink: Add
 support for "access-controller"
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

SGkgU2FyYXZhbmEKCk9uIDQvMjQvMjQgMDc6NTcsIFNhcmF2YW5hIEthbm5hbiB3cm90ZToKPiBP
biBGcmksIEphbiA1LCAyMDI0IGF0IDU6MDPigK9BTSBHYXRpZW4gQ2hldmFsbGllcgo+IDxnYXRp
ZW4uY2hldmFsbGllckBmb3NzLnN0LmNvbT4gd3JvdGU6Cj4+Cj4+IEFsbG93cyB0cmFja2luZyBk
ZXBlbmRlbmNpZXMgYmV0d2VlbiBkZXZpY2VzIGFuZCB0aGVpciBhY2Nlc3MKPj4gY29udHJvbGxl
ci4KPj4KPj4gU2lnbmVkLW9mZi1ieTogR2F0aWVuIENoZXZhbGxpZXIgPGdhdGllbi5jaGV2YWxs
aWVyQGZvc3Muc3QuY29tPgo+PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9y
Zz4KPiAKPiBQbGVhc2UgY2MgbWUgb24gZndfZGV2bGluayBwYXRjaGVzLiBBbHNvLCB0aGlzIHBh
dGNoIGlzIGJyZWFraW5nIHRoZQo+IG5vcm0gYmVsb3cuIFBsZWFzZSBzZW5kIGEgZml4IHVwIHBh
dGNoLgo+IAo+PiAtLS0KPj4gQ2hhbmdlcyBpbiBWOToKPj4gICAgICAgICAgLSBBZGRlZCBSb2In
cyByZXZpZXcgdGFnCj4+Cj4+IENoYW5nZXMgaW4gVjY6Cj4+ICAgICAgICAgIC0gUmVuYW1lZCBh
Y2Nlc3MtY29udHJvbGxlciB0byBhY2Nlc3MtY29udHJvbGxlcnMKPj4KPj4gQ2hhbmdlcyBpbiBW
NToKPj4gICAgICAgICAgLSBSZW5hbWUgZmVhdHVyZS1kb21haW4qIHRvIGFjY2Vzcy1jb250cm9s
Kgo+Pgo+PiBQYXRjaCBub3QgcHJlc2VudCBpbiBWMQo+Pgo+PiAgIGRyaXZlcnMvb2YvcHJvcGVy
dHkuYyB8IDIgKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMK
Pj4gaW5kZXggYWZkYWVmYmQwM2Y2Li43ZjczN2VhYzkxYjIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZl
cnMvb2YvcHJvcGVydHkuYwo+PiArKysgYi9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPj4gQEAgLTEy
NjgsNiArMTI2OCw3IEBAIERFRklORV9TSU1QTEVfUFJPUChsZWRzLCAibGVkcyIsIE5VTEwpCj4+
ICAgREVGSU5FX1NJTVBMRV9QUk9QKGJhY2tsaWdodCwgImJhY2tsaWdodCIsIE5VTEwpCj4+ICAg
REVGSU5FX1NJTVBMRV9QUk9QKHBhbmVsLCAicGFuZWwiLCBOVUxMKQo+PiAgIERFRklORV9TSU1Q
TEVfUFJPUChtc2lfcGFyZW50LCAibXNpLXBhcmVudCIsICIjbXNpLWNlbGxzIikKPj4gK0RFRklO
RV9TSU1QTEVfUFJPUChhY2Nlc3NfY29udHJvbGxlcnMsICJhY2Nlc3MtY29udHJvbGxlcnMiLCAi
I2FjY2Vzcy1jb250cm9sbGVyLWNlbGxzIikKPj4gICBERUZJTkVfU1VGRklYX1BST1AocmVndWxh
dG9ycywgIi1zdXBwbHkiLCBOVUxMKQo+PiAgIERFRklORV9TVUZGSVhfUFJPUChncGlvLCAiLWdw
aW8iLCAiI2dwaW8tY2VsbHMiKQo+Pgo+PiBAQCAtMTM2Myw2ICsxMzY0LDcgQEAgc3RhdGljIGNv
bnN0IHN0cnVjdCBzdXBwbGllcl9iaW5kaW5ncyBvZl9zdXBwbGllcl9iaW5kaW5nc1tdID0gewo+
PiAgICAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfcmVndWxhdG9ycywgfSwKPj4gICAgICAg
ICAgeyAucGFyc2VfcHJvcCA9IHBhcnNlX2dwaW8sIH0sCj4+ICAgICAgICAgIHsgLnBhcnNlX3By
b3AgPSBwYXJzZV9ncGlvcywgfSwKPj4gKyAgICAgICB7IC5wYXJzZV9wcm9wID0gcGFyc2VfYWNj
ZXNzX2NvbnRyb2xsZXJzLCB9LAo+IAo+IEFsbCB0aGUgc2ltcGxlIHByb3BlcnRpZXMgYXJlIGxp
c3RlZCBiZWZvcmUgdGhlIHN1ZmZpeCBvbmVzIGFzIHRoZQo+IHN1ZmZpeCBjaGVja3MgYXJlIG1v
cmUgZXhwZW5zaXZlLiBTbywgeW91IHNob3VsZCBoYXZlIGluc2VydGVkIHRoaXMKPiByaWdodCBi
ZWZvcmUgdGhlIHN1ZmZpeCBwcm9wZXJ0aWVzLiBBbHNvLCB0aGVyZSdzIGEgbWVyZ2UgY29uZmxp
Y3QgaW4KPiBsaW51eC1uZXh0LiBTbyBtYWtlIHN1cmUgeW91IHRha2UgdGhhdCBpbnRvIGFjY291
bnQgd2hlbiBzZW5kaW5nIHRoZQo+IGZpeCB1cCBhbmQgcGlja2luZyB0aGUgb3JkZXIuCgpJJ20g
Zml4aW5nIHRoZSBzdG0zMi1uZXh0IGJyYW5jaCBieSBpbnNlcnRpbmcKCiAgICAgICAgIHsgLnBh
cnNlX3Byb3AgPSBwYXJzZV9hY2Nlc3NfY29udHJvbGxlcnMsIH0sCmp1c3QgYmVmb3JlCgoJeyAu
cGFyc2VfcHJvcCA9IHBhcnNlX3JlZ3VsYXRvcnMsIH0sCgoKPiAKPiAtU2FyYXZhbmEKPiAKPj4g
ICAgICAgICAge30KPj4gICB9Owo+IAo+Pgo+PiAtLQo+PiAyLjM1LjMKPj4KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBs
aXN0CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
