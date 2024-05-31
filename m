Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 207D28D6527
	for <lists+linux-stm32@lfdr.de>; Fri, 31 May 2024 17:08:39 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id CE949C71288;
	Fri, 31 May 2024 15:08:38 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 139E1C6DD72
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 31 May 2024 15:08:32 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44VDHINw007208;
 Fri, 31 May 2024 17:08:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 J+3i1j+pq3XT9u6pb0xZVn9sOodnovVMoU1mIM4VGJQ=; b=dOyGdXidIjAPoxaE
 6i49hQm84hjxfsbuqS8JOxP0DPjudx8/pQet30Subrs9ukAG9s7xq7EXpdAh59PO
 J1zS6COBhRk4bo1fOLOH41RxCyKGiN9pMGaE7Zbumq5l8GbchkpHUIwBC0lTYQzQ
 B70h7FQS1ZtekflcMLOSed86gybMYW+3In/yS8hWQTFjBMMJbT8H2f91x8EcJe+s
 PKB6otIon8QueJzI1VroVVg5nIoyMRNlW6PD5ooQYmeiG2maVrEi+rMGKdTLxiP2
 MqbUwbaHYsqK34XkEYjcTZAb0DQPEOMsjAPvCJOULsPE36Z65MrkOqcnrpFui1bP
 L7gG4w==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3yb9ykd6sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 May 2024 17:08:14 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2712740045;
 Fri, 31 May 2024 17:08:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 89C09223652;
 Fri, 31 May 2024 17:07:18 +0200 (CEST)
Received: from localhost (10.252.27.179) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 31 May
 2024 17:07:18 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Fri, 31 May 2024 17:07:03 +0200
Message-ID: <20240531150712.2503554-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
References: <20240531150712.2503554-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.252.27.179]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_11,2024-05-30_01,2024-05-17_01
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v4 03/12] MAINTAINERS: Add entry for STM32 DMA
	controllers drivers and documentation
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

QWRkIGFuIGVudHJ5IHRvIG1ha2UgbXlzZWxmIGEgbWFpbnRhaW5lciBvZiBTVE0zMiBETUEgY29u
dHJvbGxlcnMgZHJpdmVycwphbmQgZG9jdW1lbnRhdGlvbi4KClNpZ25lZC1vZmYtYnk6IEFtZWxp
ZSBEZWxhdW5heSA8YW1lbGllLmRlbGF1bmF5QGZvc3Muc3QuY29tPgotLS0KIE1BSU5UQUlORVJT
IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGQ2YzkwMTYxYzdiZi4uZTIzY2M2
ZjY0NGZhIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMjE0
ODUsNiArMjE0ODUsMTUgQEAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lp
by9hZGMvc3Qsc3RtMzItZGZzZG0tYWRjLnlhbWwKIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb3VuZC9zdCxzdG0zMi0qLnlhbWwKIEY6CXNvdW5kL3NvYy9zdG0vCiAKK1NU
TTMyIERNQSBEUklWRVJTCitNOglBbcOpbGllIERlbGF1bmF5IDxhbWVsaWUuZGVsYXVuYXlAZm9z
cy5zdC5jb20+CitMOglkbWFlbmdpbmVAdmdlci5rZXJuZWwub3JnCitMOglsaW51eC1zdG0zMkBz
dC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tIChtb2RlcmF0ZWQgZm9yIG5vbi1zdWJzY3JpYmVy
cykKK1M6CU1haW50YWluZWQKK0Y6CURvY3VtZW50YXRpb24vYXJjaC9hcm0vc3RtMzIvc3RtMzIt
ZG1hLW1kbWEtY2hhaW5pbmcucnN0CitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZG1hL3N0bTMyLworRjoJZHJpdmVycy9kbWEvc3RtMzIvCisKIFNUTTMyIFRJTUVSL0xQVElN
RVIgRFJJVkVSUwogTToJRmFicmljZSBHYXNuaWVyIDxmYWJyaWNlLmdhc25pZXJAZm9zcy5zdC5j
b20+CiBTOglNYWludGFpbmVkCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LXN0bTMyIG1haWxpbmcgbGlzdApMaW51eC1zdG0z
MkBzdC1tZC1tYWlsbWFuLnN0b3JtcmVwbHkuY29tCmh0dHBzOi8vc3QtbWQtbWFpbG1hbi5zdG9y
bXJlcGx5LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXN0bTMyCg==
