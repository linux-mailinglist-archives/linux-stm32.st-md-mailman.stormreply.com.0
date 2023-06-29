Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBD742299
	for <lists+linux-stm32@lfdr.de>; Thu, 29 Jun 2023 10:50:47 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BC354C6B455;
	Thu, 29 Jun 2023 08:50:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 426ADC6905A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 29 Jun 2023 08:50:45 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 35T8eQc7032628; Thu, 29 Jun 2023 10:50:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=cKRDhcYGE2304v3AHs3pTy7Pg2of5P6CKuIzn2WxvxY=;
 b=Iu0seLtFinMLh0VAEVMwXlQbAOakMWSMZasslxXMw6Mela191burd4UMVkSl1OAMhTW6
 x5j73ysrjxTtJPWz3TlMbhY8k+jjBNPbF+z03B7E02H02NoziZLYLiqkQ8c9IxmEGCWO
 nSItX2pFUTe3ZbfuSkms0Eczr1xHdJRRfFCDD2HYSrVGKUeq5ZhBCnoWZdrX2NUjoaU+
 XMUEa1rfNSCwJEWXfAeZFhxb1EOF+psHSK2UOutwFZtCePKXMkGZ9fE91wHERaVViMCp
 pmTShR1MmR6GsftWrFEB/8wwHdNVdYpXU5Nb/o+Fe7iIRfglptEBIDUXEGHGeixH5GvW hA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rh299hnvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Jun 2023 10:50:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 02B98100060;
 Thu, 29 Jun 2023 10:50:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EE8E92194C1;
 Thu, 29 Jun 2023 10:50:14 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 29 Jun
 2023 10:50:12 +0200
Message-ID: <6794df85-72b2-e7d7-3192-e451e6afded4@foss.st.com>
Date: Thu, 29 Jun 2023 10:50:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 <linux-kernel@vger.kernel.org>
References: <20230629083726.84910-1-dario.binacchi@amarulasolutions.com>
 <20230629083726.84910-3-dario.binacchi@amarulasolutions.com>
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230629083726.84910-3-dario.binacchi@amarulasolutions.com>
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
Subject: Re: [Linux-stm32] [PATCH v5 2/3] ARM: dts: stm32: add pin map for
	LTDC on stm32f7
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

SGksCgpPbiA2LzI5LzIzIDEwOjM3LCBEYXJpbyBCaW5hY2NoaSB3cm90ZToKPiBBZGQgcGluIGNv
bmZpZ3VyYXRpb25zIGZvciB1c2luZyBMVERDIChMQ0QtdGZ0IERpc3BsYXkgQ29udHJvbGxlcikg
b24KPiBzdG0zMmY3NDYtZGlzY28gYm9hcmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBCaW5h
Y2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4KPiAtLS0KPgo+IChu
byBjaGFuZ2VzIHNpbmNlIHYzKQo+Cj4gQ2hhbmdlcyBpbiB2MzoKPiAtIHJlbmFtZSBsdGRjLXBp
bnMtYS0wIHRvIGx0ZGMtMC4KPgo+ICBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY3LXBpbmN0cmwu
ZHRzaSB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
NSBpbnNlcnRpb25zKCspCgpSZXZpZXdlZC1ieTogUmFwaGHDq2wgR2FsbGFpcy1Qb3UgPHJhcGhh
ZWwuZ2FsbGFpcy1wb3VAZm9zcy5zdC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJA
c3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1y
ZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
