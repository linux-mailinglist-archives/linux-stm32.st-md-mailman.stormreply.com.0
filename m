Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD274B1DE
	for <lists+linux-stm32@lfdr.de>; Fri,  7 Jul 2023 15:37:46 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 678AAC6B45C;
	Fri,  7 Jul 2023 13:37:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3BA3CC6A5EF
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  7 Jul 2023 13:37:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 367CJpQN025678; Fri, 7 Jul 2023 15:37:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=AlQZY5LT1nTn4acrErO3htvTgmM0dSsRRWDtSKCM29g=;
 b=uXC3vobBdtI/ii6QBTgL/q/7SX8CMZJi+egJs11DXDUok/Q4IC7N9brib/wpRGzk6Vhv
 cO94oR/zhHMNkJ+n8kMJ7QINAKPoZEMcLGdWWrd9vyvrdxoia6VPhyF8GBuo7AWLG3lr
 /Pe8HVvDBEhGKj6Kxj7KVN3KvibOAB6rq/cU4xu+iXrxxdX3l2RbwcT16gl2pHq5CU44
 ODJyAvDeCHD6vyR3G3RMZB+LGcJbuVlPy9eYEY6IAjOqDJBDuyqzqgE13ZxAKKYuuPSz
 T5VX+MGV09Gfm3tKhDdjQJ3vVcF7Q8Tlp7Y+zkgCwTddJcU4LOU347+3GZp33HTCAfFl xg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3rpjm7rhp8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 15:37:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2EFBF10004B;
 Fri,  7 Jul 2023 15:37:24 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E0572248C8;
 Fri,  7 Jul 2023 15:37:24 +0200 (CEST)
Received: from [10.129.178.187] (10.129.178.187) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 7 Jul
 2023 15:37:23 +0200
Message-ID: <458d68b6-8b2f-ad4c-67c3-e49fe30656ac@foss.st.com>
Date: Fri, 7 Jul 2023 15:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
To: Yangtao Li <frank.li@vivo.com>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
 <20230707072034.48977-13-frank.li@vivo.com>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20230707072034.48977-13-frank.li@vivo.com>
X-Originating-IP: [10.129.178.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-07_09,2023-07-06_02,2023-05-22_02
Cc: linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 13/18] drm/stm: ltdc: Convert to
 devm_platform_ioremap_resource()
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

SGkKCk9uIDcvNy8yMyAwOToyMCwgWWFuZ3RhbyBMaSB3cm90ZToKPiBVc2UgZGV2bV9wbGF0Zm9y
bV9pb3JlbWFwX3Jlc291cmNlKCkgdG8gc2ltcGxpZnkgY29kZS4KPgo+IFNpZ25lZC1vZmYtYnk6
IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
c3RtL2x0ZGMuYyB8IDQgKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDMg
ZGVsZXRpb25zKC0pCgoKQWNrZWQtYnk6IFJhcGhhw6tsIEdhbGxhaXMtUG91IDxyYXBoYWVsLmdh
bGxhaXMtcG91QGZvc3Muc3QuY29tPgoKVGhhbmtzIGZvciB5b3VyIGNvbnRyaWJ1dGlvbiwKClJh
cGhhw6tsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1zdG0zMiBtYWlsaW5nIGxpc3QKTGludXgtc3RtMzJAc3QtbWQtbWFpbG1hbi5zdG9ybXJl
cGx5LmNvbQpodHRwczovL3N0LW1kLW1haWxtYW4uc3Rvcm1yZXBseS5jb20vbWFpbG1hbi9saXN0
aW5mby9saW51eC1zdG0zMgo=
