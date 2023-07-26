Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E86763244
	for <lists+linux-stm32@lfdr.de>; Wed, 26 Jul 2023 11:33:48 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8F8E7C6A61A;
	Wed, 26 Jul 2023 09:33:48 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4D36DC65E4C
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed, 26 Jul 2023 09:33:47 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36Q7mprC023350; Wed, 26 Jul 2023 11:33:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=/Cq+mWzaYAzM3dk654+FXTT9IrqSv23zfpbnKE8bKxM=;
 b=Q3i1gVoUyXsOG+9S8AzF+qC7KGYRPJp1BCc8yu19RqFYSEYXR+81aMgiqDR45yEeyPqO
 J+U3uov9ofSS5wPMhYZ9+4/I7yoG4y4+8katCpM+tSm+G4l/cyvw4mN5swVzqt2fYz1S
 bfKZRzHV8x7Kom11ShfbZ53EZcJIdyyJN+AiP8cxN5/mICmfx+rToX+nVgHVP8/cnFWf
 epKhxqQqSlw0L+nHtRZGH+rh+T1QQLgWgFQA+vVJ65W56Qod/6jQdjeSkvBm9SME4WcU
 E4hHx370z65KeipWwjPTCZPdxiSvq2f8S2ouOVDcvTyBIP2Gg5qihokSU89pm2KM33oL pg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s2ye8gv6r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 11:33:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A74DF10002A;
 Wed, 26 Jul 2023 11:33:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 90F66212FCB;
 Wed, 26 Jul 2023 11:33:17 +0200 (CEST)
Received: from [10.48.1.0] (10.48.1.0) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Wed, 26 Jul
 2023 11:33:16 +0200
Message-ID: <a442c999-4120-c945-c671-d5fe2c21522c@foss.st.com>
Date: Wed, 26 Jul 2023 11:33:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <p.paillet@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Claudiu Beznea <claudiu.beznea@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Fabrice Gasnier
 <fabrice.gasnier@foss.st.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230712142432.1885162-1-p.paillet@foss.st.com>
 <20230712142432.1885162-5-p.paillet@foss.st.com>
 <aa05bcd6-140d-d951-2c7f-c09abf7f49f7@linaro.org>
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <aa05bcd6-140d-d951-2c7f-c09abf7f49f7@linaro.org>
X-Originating-IP: [10.48.1.0]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_03,2023-07-25_01,2023-05-22_02
Subject: Re: [Linux-stm32] [PATCH 4/4] ARM: multi_v7_defconfig: Add SCMI
	regulator support
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

SGksCgpPbiA3LzEyLzIzIDIxOjI1LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOgo+IE9uIDEy
LzA3LzIwMjMgMTY6MjQsIHAucGFpbGxldEBmb3NzLnN0LmNvbSB3cm90ZToKPj4gRnJvbTogUGFz
Y2FsIFBhaWxsZXQgPHAucGFpbGxldEBmb3NzLnN0LmNvbT4KPj4KPj4gRW5hYmxlIEFSTSBTQ01J
IHJlZ3VsYXRvciBzdXBwb3J0Lgo+Pgo+IFRoaXMgd2Ugc2VlIGZyb20gdGhlIGRpZmYuIFBsZWFz
ZSBleHBsYWluIHdoeSwgZS5nLiB3aGljaCBib2FyZHMgdXNlIGl0Lgo+Cj4gQmVzdCByZWdhcmRz
LAo+IEtyenlzenRvZgoKClRoZSBTVE0zMk1QIHBsYXRmb3JtcyByZWx5IG9uIE9QLVRFRSB0byBi
b290OiBDbG9ja3MgYW5kIHJlZ3VsYXRvcnMgYXJlIApoYW5kbGVkIGluCnRoZSBzZWN1cmUgd29y
bGQgYnkgT1AtVEVFIGFuZCBleHBvcnRlZCB0byB0aGUgbm9uIHNlY3VyZSB3b3JsZCAoTElOVVgp
CnRoYW5rcyB0byBBUk0gU0NNSSBwcm90b2NvbC4KClRvZGF5IGl0IGlzIHVzZWQgaW4gdGhlIEFS
TXY3IFNUTWljcm9sZWN0cm9uaWNzIHN0bTMybXAgYm9hcmRzOgotIGZvciBTVE0zMk1QMTM6IHN0
bTMybXAxMzVmLWRrCi0gdGhlIFNUTTMyTVAxNSBib2FyZHMgd2l0aCBTQ01JIHZhcmlhbnQsIGlu
dHJvZHVjZWQgYnkgY29tbWl0IDViN2U1ODMxM2E3NwogwqAgKCJBUk06IGR0czogc3RtMzI6IEFk
ZCBTQ01JIHZlcnNpb24gb2YgU1RNMzIgYm9hcmRzIChESzEvREsyL0VEMS9FVjEpIikKIMKgICog
c3RtMzJtcDE1N2MtZXYxLXNjbWkKIMKgICogc3RtMzJtcDE1N2MtZWQxLXNjbWkKIMKgICogc3Rt
MzJtcDE1N2MtZGsyLXNjbWkKIMKgICogc3RtMzJtcDE1N2EtZGsxLXNjbWkKClRoaXMgU0NNSSBz
ZXJ2ZXIgcHJvdmlkZSBhY2Nlc3MgdG8gInNlY3VyZWQiIHJlc291cmNlcyBwcm90ZWN0ZWQgaW4g
U29DCihmb3IgZXhhbXBsZSB3aXRoIFJDQ19TRUNGR1IpOyB0aGUgcmVzb3VyY2VzIG5lZWQgdG8g
YmUgYXZhaWxhYmxlIGVhcmx5CmZvciB0aGVzZSBib2FyZCBhbmQgdGhlwqAgU0NNSSBzZXJ2ZXIg
aXMgYXNzb2NpYXRlZCB3aXRoIE9QLVRFRSwgYWxyZWFkeQphY3RpdmF0ZWQgYnkgdGhlIGNvbW1p
dCAyNGMxNTk3OTMyMzjCoCAoIkFSTTogbXVsdGlfdjdfZGVmY29uZmlnOiBBZGQKT1BURUUgc3Vw
cG9ydCIpLgoKUmVnYXJkcwoKUGF0cmljawoKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LWFybS1rZXJuZWwgbWFpbGluZyBsaXN0Cj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hcm0ta2VybmVsCj4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtc3RtMzIgbWFpbGluZyBsaXN0
CkxpbnV4LXN0bTMyQHN0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20KaHR0cHM6Ly9zdC1tZC1t
YWlsbWFuLnN0b3JtcmVwbHkuY29tL21haWxtYW4vbGlzdGluZm8vbGludXgtc3RtMzIK
