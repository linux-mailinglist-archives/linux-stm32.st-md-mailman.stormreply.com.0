Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CBBD32B5C66
	for <lists+linux-stm32@lfdr.de>; Tue, 17 Nov 2020 11:00:30 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 80125C3FADD;
	Tue, 17 Nov 2020 10:00:30 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 12509C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 17 Nov 2020 10:00:28 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AH9bavK025748; Tue, 17 Nov 2020 11:00:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=y2Io4U8P70EBSSJuLyQPTHs4SXuaogmus/3Tq9b2AiA=;
 b=I9ZlYEsUrv1jfABsS3t0ujS5lzVZFwnES52kL3SRMyQepR/eYYwXeVmHp1R2dqK6v7tw
 O/CUpyqg80K+TpYAIBsYBvAC1vJ8D8G8Rz8m9d2VxRh6Mgn8umFvGBSZ7Y2s9IVcPXQ5
 m1Vj+SbbAn5fLjcejNauhMb7WZS+zU9pr7t0o+Jx43opkzNQ+o1aIe82NC87fH9uDF8l
 kr//nh+sHdULjoAUkFZFB1WedgZAXpNvH6oe0AXCH8+Urlz9l06cJZJ8hlVK29j/mTMv
 d4vS4THOQU1Z6Z6fY/f8/NQX3sw1eRg7LCi7X4TUEveo0jKzs81Lsk5Cjt8kZbcVDKPU og== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 34t5w1r975-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 11:00:22 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id DDA5510002A;
 Tue, 17 Nov 2020 11:00:21 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CBDA2238C96;
 Tue, 17 Nov 2020 11:00:21 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 17 Nov
 2020 11:00:21 +0100
To: Amelie Delaunay <amelie.delaunay@st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20201110131059.7826-1-amelie.delaunay@st.com>
From: Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <f324e117-114b-3f2f-318a-9b57a93438bc@st.com>
Date: Tue, 17 Nov 2020 10:59:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201110131059.7826-1-amelie.delaunay@st.com>
Content-Language: en-US
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-17_03:2020-11-13,
 2020-11-17 signatures=0
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 1/1] ARM: dts: stm32: adjust USB OTG
 gadget fifo sizes in stm32mp151
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

SGkgQW3DqWxpZQoKT24gMTEvMTAvMjAgMjoxMCBQTSwgQW1lbGllIERlbGF1bmF5IHdyb3RlOgo+
IERlZmF1dCB1c2UgY2FzZSBvbiBzdG0zMm1wMTUxIFVTQiBPVEcgaXMgZXRoZXJuZXQgZ2FkZ2V0
LCB1c2luZyBFUDEgYnVsawo+IGVuZHBvaW50IChNUFM9NTEyIGJ5dGVzKSBhbmQgRVAyIGludGVy
cnVwdCBlbmRwb2ludCAoTVBTPTE2IGJ5dGVzKS4KPiBUaGlzIHBhdGNoIG9wdGltaXplcyBVU0Ig
T1RHIEZJRk8gc2l6ZXMgYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW1lbGllIERl
bGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAc3QuY29tPgo+IC0tLQo+ICAgYXJjaC9hcm0vYm9vdC9k
dHMvc3RtMzJtcDE1MS5kdHNpIHwgNCArKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMm1wMTUxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1wMTUxLmR0c2kKPiBp
bmRleCA2ZmZjZjA2ZGMwZTguLjkyOGUzMWRiMTUyNiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybS9i
b290L2R0cy9zdG0zMm1wMTUxLmR0c2kKPiArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMm1w
MTUxLmR0c2kKPiBAQCAtMTA3MCw5ICsxMDcwLDkgQEAKPiAgIAkJCXJlc2V0cyA9IDwmcmNjIFVT
Qk9fUj47Cj4gICAJCQlyZXNldC1uYW1lcyA9ICJkd2MyIjsKPiAgIAkJCWludGVycnVwdHMgPSA8
R0lDX1NQSSA5OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiAtCQkJZy1yeC1maWZvLXNpemUgPSA8
MjU2PjsKPiArCQkJZy1yeC1maWZvLXNpemUgPSA8NTEyPjsKPiAgIAkJCWctbnAtdHgtZmlmby1z
aXplID0gPDMyPjsKPiAtCQkJZy10eC1maWZvLXNpemUgPSA8MTI4IDEyOCA2NCA2NCA2NCA2NCAz
MiAzMj47Cj4gKwkJCWctdHgtZmlmby1zaXplID0gPDI1NiAxNiAxNiAxNiAxNiAxNiAxNiAxNj47
Cj4gICAJCQlkcl9tb2RlID0gIm90ZyI7Cj4gICAJCQl1c2IzM2Qtc3VwcGx5ID0gPCZ1c2IzMz47
Cj4gICAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IAoKQXBwbGllZCBvbiBzdG0zMi1uZXh0LgoK
VGhhbmtzLgpBbGV4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1tZC1tYWlsbWFuLnN0
b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
