Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9264FA02DA8
	for <lists+linux-stm32@lfdr.de>; Mon,  6 Jan 2025 17:22:22 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2B1C2C78011;
	Mon,  6 Jan 2025 16:22:22 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5C7D8C6B47E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  6 Jan 2025 16:08:18 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506FTvZH025120;
 Mon, 6 Jan 2025 17:07:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 t7wyUdadEoYLGmcBhlYZBQxE/bFc8L6HId4ivUrzHOQ=; b=BNGNVisGo6IoTdnN
 3iDdo2Pi+3vbkNYy3xLrSlFyVYwfymaJnw4unEXO2RAIgeb9qBL/cY165wIWXIFV
 zvBDNRwet3qONWViE4srR6Ky8rS9gs7QwkIQI+P1YkKCh8DAQJfuaelaYl0Nu5/Q
 uM64UZCu4tARtIQUjaP+XsTAYWx/FvZ3AC89m6qfWZcSHNr1gWWP+8Y1kPLaO0i7
 J4gu5ZfIB7ADWPqtGWM6KzpgkqDtUm3vpVOQL1vRqyct2g+yAkm9JHP2TELHeADq
 XDcIqHxLYko2IbkysackZ378Q7t5u17HXgEFnv0knuRCRkrmQtyLoOnV3XnS0nSD
 8Gt63A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 440cbrsdam-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jan 2025 17:07:38 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B03014004D;
 Mon,  6 Jan 2025 17:06:01 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 78714276BB8;
 Mon,  6 Jan 2025 17:04:58 +0100 (CET)
Received: from [10.252.22.94] (10.252.22.94) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 6 Jan
 2025 17:04:57 +0100
Message-ID: <0335a999-9ff1-4527-a21f-d04392c520b6@foss.st.com>
Date: Mon, 6 Jan 2025 17:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sean Nyekjaer <sean@geanix.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yannick
 Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20241125-dsi-relax-v2-3-9113419f4a40@geanix.com>
X-Originating-IP: [10.252.22.94]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Mailman-Approved-At: Mon, 06 Jan 2025 16:22:20 +0000
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
Subject: Re: [Linux-stm32] [PATCH v2 3/3] drm/stm: dsi: use
 drm_mode_validate_mode() helper function
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

Ck9uIDExLzI1LzI0IDE0OjQ5LCBTZWFuIE55ZWtqYWVyIHdyb3RlOgo+IFdoZW4gdXNpbmcgdGhl
IERTSSBpbnRlcmZhY2UgdmlhIERTSTJMVkRTIGJyaWRnZSwgaXQgc2VlbXMgYSBiaXQgaGFyc2gg
dG8KPiByZWd1aXJlIHRoZSByZXF1ZXN0ZWQgYW5kIHRoZSBhY3R1YWwgcHggY2xvY2sgdG8gYmUg
d2l0aGluIDUwSHouIEEgdHlwaWNhbAo+IExWRFMgZGlzcGxheSByZXF1aXJlcyB0aGUgcHggY2xv
Y2sgdG8gYmUgd2l0aGluICstMTAlLiBJbiBjYXNlIGZvciBIRE1JIC41JQo+IHRvbGVyYW5jZSBp
cyByZXF1aXJlZC4gU2lnbmVkLW9mZi1ieTogU2VhbiBOeWVramFlciA8c2VhbkBnZWFuaXguY29t
Pi0tLQoKCkhpIFNlYW4sCgpBY2tlZC1ieTogUmFwaGFlbCBHYWxsYWlzLVBvdSA8cmFwaGFlbC5n
YWxsYWlzLXBvdUBmb3NzLnN0LmNvbT4KClRoYW5rcywKUmFwaGHDq2wKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1zdG0zMiBtYWlsaW5nIGxp
c3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJlcGx5LmNvbQpodHRwczovL3N0LW1k
LW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0aW5mby9saW51eC1zdG0zMgo=
