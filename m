Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F4A44784
	for <lists+linux-stm32@lfdr.de>; Tue, 25 Feb 2025 18:12:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CD903C78F9F;
	Tue, 25 Feb 2025 17:12:33 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C8156C78F65
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 25 Feb 2025 17:12:32 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PFJbae032256;
 Tue, 25 Feb 2025 18:12:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 b7ilTU0nfN/VhX4AMlIMGSs7WY/ZNM9E5SfWaQXtVJA=; b=Nrq3B2BxNYdXhmuF
 +jmL73KaSfStcX8QKPExFFoP7RqoSXYGRppAkI6ARlaK53KL1dyVyO4IMN3JVCnu
 tGYXS6HfgioN2NTwRJczUCCAzE/57xH5+kkV2Cxd+AHYpSo3/5Rp4fedb48NofFU
 yRjXtSt7zrXgOVoz1WW7amsqH28Yp3rUjJrK+GLhi7HIdO+d3IRP3u2GRmnhln0m
 wPzqD2UC/k8vmQbeA/rNHAVlwELmzgPuiainGS0hQhjKPcssCNvWe615sk4+RGOy
 /wQR2a7PFRz4SNwGT2jVCzJbDqAn0mnb30eauFGVK8qKkbI8fMakiei+0nXKNr1q
 eIqVKw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4512sp4ukf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Feb 2025 18:12:23 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69B38400E3;
 Tue, 25 Feb 2025 18:11:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 72F044DBF82;
 Tue, 25 Feb 2025 16:51:36 +0100 (CET)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 16:51:35 +0100
Message-ID: <91f19306-4b31-41fe-8ad2-680b1a339204@foss.st.com>
Date: Tue, 25 Feb 2025 16:51:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250225-hdp-upstream-v1-0-9d049c65330a@foss.st.com>
 <20250225-hdp-upstream-v1-2-9d049c65330a@foss.st.com>
 <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <6fc80544-6fc3-4450-a0cc-bfc740fe97bb@kernel.org>
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_05,2025-02-25_03,2024-11-22_01
Cc: linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: pinctrl: stm32:
	Introduce HDP
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

T24gMi8yNS8yNSAxNDowNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAyNS8wMi8y
MDI1IDA5OjQ4LCBDbMOpbWVudCBMZSBHb2ZmaWMgd3JvdGU6Cj4+ICsKPj4gK21haW50YWluZXJz
Ogo+PiArICAtIENsw6ltZW50IExFIEdPRkZJQyA8Y2xlbWVudC5sZWdvZmZpY0Bmb3NzLnN0LmNv
bT4KPj4gKwo+PiArZGVzY3JpcHRpb246IHwKPiAKPiAKPiBEbyBub3QgbmVlZCAnfCcgdW5sZXNz
IHlvdSBuZWVkIHRvIHByZXNlcnZlIGZvcm1hdHRpbmcuCgpPawoKPj4gKyAgU1RNaWNyb2VsZWN0
cm9uaWNzJ3MgU1RNMzIgTVBVcyBpbnRlZ3JhdGUgYSBIYXJkd2FyZSBEZWJ1ZyBQb3J0IChIRFAp
Lgo+PiArICBJdCBhbGxvd3MgdG8gb3V0cHV0IGludGVybmFsIHNpZ25hbHMgb24gU29DJ3MgR1BJ
Ty4KPj4gKwo+PiArcHJvcGVydGllczoKPj4gKyAgY29tcGF0aWJsZToKPj4gKyAgICBjb25zdDog
c3Qsc3RtMzJtcC1oZHAKPiAKPiBUaGVyZSBpcyBhIG1lc3MgaW4gU1RNIFNvQ3MuIFNvbWV0aW1l
cyB5b3UgY2FsbCBTb0Mgc3RtMzIsIHNvbWV0aW1lcwo+IHN0bTMybXAgYW5kIHNvbWV0aW1lcyBz
dG0zMm1wWFguCj4gCj4gRGVmaW5lIGZvciBhbGwgeW91ciBTVE0gY29udHJpYnV0aW9ucyB3aGF0
IGlzIHRoZSBhY3R1YWwgU29DLiBUaGlzCj4gZmVlZGJhY2sgd2FzIGFscmVhZHkgZ2l2ZW4gdG8g
U1QuCj4gCj4+ICsKPj4gKyAgcmVnOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gKyAgY2xv
Y2tzOgo+PiArICAgIG1heEl0ZW1zOiAxCj4+ICsKPj4gK3BhdHRlcm5Qcm9wZXJ0aWVzOgo+PiAr
ICAnLXBpbnMkJzoKPj4gKyAgICB0eXBlOiBvYmplY3QKPj4gKyAgICAkcmVmOiBwaW5tdXgtbm9k
ZS55YW1sIwo+PiArCj4+ICsgICAgcHJvcGVydGllczoKPj4gKyAgICAgIGZ1bmN0aW9uOgo+PiAr
ICAgICAgICBlbnVtOiBbICIwIiwgIjEiLCAiMiIsICIzIiwgIjQiLCAiNSIsICI2IiwgIjciLAo+
PiArICAgICAgICAgICAgICAgICI4IiwgIjkiLCAiMTAiLCAiMTEiLCAiMTIiLCAiMTMiLCAiMTQi
LAo+PiArICAgICAgICAgICAgICAgICIxNSIgXQo+IAo+IEZ1bmN0aW9uIHdoaWNoIGhhcyBhIG51
bWJlciBpcyBub3QgcmVhbGx5IHVzZWZ1bC4gV2hhdCBkb2VzIGl0IGV2ZW4gZXhwcmVzcz8KCkFz
IHNhaWQgaW4gbXkgcHJldmlvdXMgYW5zd2VyLCBmdW5jdGlvbiBuYW1lcyBhcmUgdmVyeSBkaWZm
ZXJlbnQgZnJvbSAKb25lIHBsYXRmb3JtIHRvIGFub3RoZXIuIE51bWJlcnMgd2VyZSB1c2VkIGFz
IHN0cmluZyB0byBiZSBnZW5lcmljLgpJJ2xsIGNvbnNpZGVyIGl0IGluIGEgVjIuCgo+IAo+PiAr
Cj4+ICsgICAgICBwaW5zOgo+PiArICAgICAgICBlbnVtOiBbIGhkcDAsIGhkcDEsIGhkcDIsIGhk
cDMsIGhkcDQsIGhkcDUsIGhkcDYsIGhkcDcgXQo+PiArCj4+ICsgICAgcmVxdWlyZWQ6Cj4+ICsg
ICAgICAtIGZ1bmN0aW9uCj4+ICsgICAgICAtIHBpbnMKPj4gKwo+PiArICAgIGFkZGl0aW9uYWxQ
cm9wZXJ0aWVzOiBmYWxzZQo+PiArCj4+ICthbGxPZjoKPj4gKyAgLSAkcmVmOiBwaW5jdHJsLnlh
bWwjCj4+ICsKPj4gK3JlcXVpcmVkOgo+PiArICAtIGNvbXBhdGlibGUKPj4gKyAgLSByZWcKPj4g
KyAgLSBjbG9ja3MKPj4gKwo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlCj4+ICsKPj4g
K2V4YW1wbGVzOgo+PiArICAtIHwKPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvY2xvY2sv
c3RtMzJtcDEtY2xrcy5oPgo+PiArICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9waW5jdHJsL3N0
bTMybXAxNS1oZHAuaD4KPj4gKyAgICAvL0V4YW1wbGUgMQo+IAo+IERyb3AKCk9rCgo+IAo+IEJl
c3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0zMkBzdC1t
ZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5
LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
