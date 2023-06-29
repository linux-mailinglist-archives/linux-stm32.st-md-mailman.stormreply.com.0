Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 204DF7422A5
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 10:51:53 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DAA28C6B455;
	Thu, 29 Jun 2023 08:51:52 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE464C6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 08:51:51 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35T8dv15032715; Thu, 29 Jun 2023 10:51:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Iz+hQhO6dEojH0eFv013M4o5vsc6rHv4k2nkimlmwAM=;
 b=PdwR5pfs2D/jQIdC/dGfJ1lcD9R8HIfYCiHPf1JIyDsnBSN4yZF7r4cXcaIcRBR/S/AP
 acx8ekRBjHeGDNQDUS/2jTHUcD1091cxUFSjIqDWdU0ovBH70ehEL+ysG+Y5Vwus+3tC
 MxJlk+WsDFd/YqDpiFIWkAuwlCZcaemUwItee0g4kkvbLMm0JmTUpFqAG6UJS//QVMiI
 q0yxidxZniVxB0mNKgSwPRmGmtxLcowIGBTkMRcSgreViKN4A8gmBIJLMsIGqWDXSnW/
 tPZQ95PRSxh46HPNMsnoVr6O26DIl21vFnJRxATkUMwogO34eZAD1cyKEPApFgeTOFHl fg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rh299hp5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 10:51:42 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C0B3A100060;
 Thu, 29 Jun 2023 10:51:41 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B88692194CE;
 Thu, 29 Jun 2023 10:51:41 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 29 Jun
 2023 10:51:40 +0200
Message-ID: <c20287a0-7daf-0867-31d0-fc4057798f68@foss.st.com>
Date: Thu, 29 Jun 2023 10:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
 <20230629083726.84910-4-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230629083726.84910-4-dario.binacchi@amarulasolutions.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v5 3/3] ARM: dts: stm32: support display
 on stm32f746-disco board
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

SGksCgpPbiA2LzI5LzIzIDEwOjM3LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBBZGQgc3VwcG9y
dCB0byBSb2NrdGVjaCBSSzA0M0ZONDhIIGRpc3BsYXkgb24gc3RtMzJmNzQ2LWRpc2NvIGJvYXJk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1
bGFzb2x1dGlvbnMuY29tPgo+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY1Ogo+IEkgYW0gY29uZmlk
ZW50IHRoYXQgZnJhbWVidWZmZXIgc2l6aW5nIGlzIGEgcmVhbCByZXF1aXJlbWVudCBmb3IgU1RN
MzIgYm9hcmRzLAo+IGJ1dCBJIG5lZWQgc29tZSB0aW1lIHRvIHVuZGVyc3RhbmQgaWYgYW5kIGhv
dyB0byBpbnRyb2R1Y2UgdGhpcyBmdW5jdGlvbmFsaXR5Lgo+IFRoZXJlZm9yZSwgSSBkcm9wIHRo
ZSBmb2xsb3dpbmcgcGF0Y2hlcyB0byBhbGxvdyB0aGUgc2VyaWVzIHRvIGJlIGZ1bGx5IG1lcmdl
ZDoKPiAgLSBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc3RtMzItbHRkYzogYWRkIG9wdGlv
bmFsIHN0LGZiLWJwcCBwcm9wZXJ0eQo+ICAtIFs1LzZdIEFSTTogZHRzOiBzdG0zMjogc2V0IGZy
YW1lYnVmZmVyIGJpdCBkZXB0aCBvbiBzdG0zMmY3NDYtZGlzY28KPiAgLSBbNi82XSBkcm0vc3Rt
OiBzZXQgZnJhbWVidWZmZXIgYml0IGRlcHRoIHRocm91Z2ggRFRTIHByb3BlcnR5Cj4KPiBDaGFu
Z2VzIGluIHY0Ogo+IC0gVXNlIERUUyBwcm9wZXJ0eSBpbnN0ZWFkIG9mIG1vZHVsZSBwYXJhbWV0
ZXIgdG8gc2V0IHRoZSBmcmFtZWJ1ZmZlciBiaXQgZGVwdGguCj4KPiBDaGFuZ2VzIGluIHYzOgo+
IC0gZHJvcCBbNC82XSBkdC1iaW5kaW5nczogZGlzcGxheTogc2ltcGxlOiBhZGQgUm9ja3RlY2gg
UkswNDNGTjQ4SAo+ICAgQXBwbGllZCB0byBodHRwczovL2Fub25naXQuZnJlZWRlc2t0b3Aub3Jn
L2dpdC9kcm0vZHJtLW1pc2MuZ2l0IChkcm0tbWlzYy1uZXh0KToKPiAgIGh0dHBzOi8vY2dpdC5m
cmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjL2NvbW1pdC8/aWQ9YzQyYTM3YTI3Yzc3N2Q2Mzk2
MWRkNjM0YTMwZjdjODg3OTQ5NDkxYQo+IC0gZHJvcCBbNS82XSBkcm0vcGFuZWw6IHNpbXBsZTog
YWRkIHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMDQzRk40OEggcGFuZWwKPiAgIEFwcGxpZWQgdG8g
aHR0cHM6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9naXQvZHJtL2RybS1taXNjLmdpdCAoZHJt
LW1pc2MtbmV4dCkKPiAgIGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNj
L2NvbW1pdC8/aWQ9MTNjZGQxMmE5ZjkzNDE1OGY0ZWM4MTdjZjA0OGZjYjQzODRhYTlkYwo+Cj4g
IGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjc0Ni1kaXNjby5kdHMgfCA1MSArKysrKysrKysrKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDUxIGluc2VydGlvbnMoKykKCgpSZXZp
ZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhhZWwuZ2FsbGFpcy1wb3VAZm9zcy5z
dC5jb20+CgpUaGFua3MsClJhcGhhw6tsIEcuLVAuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3Rt
MzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rv
cm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
