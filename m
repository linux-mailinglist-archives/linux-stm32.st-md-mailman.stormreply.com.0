Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 843778AE615
	for <lists+linux-stm32@lfdr.de>; Tue, 23 Apr 2024 14:34:41 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 21F62C71291;
	Tue, 23 Apr 2024 12:34:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BA4D2C57194
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 23 Apr 2024 12:34:38 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43NC4kw4017695;
 Tue, 23 Apr 2024 14:34:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=
 selector1; bh=n7hVufsgTZ5gpYQHZe2dOCK3i7enDHUkBsTupDTYBHA=; b=f9
 T5Kr7MIwWY78nq1kSRmaY1bXfuQ06OaaPxGGMHC30419tCppkMrNdCbhDpVsFGye
 T/XaZGTpvFAGc4ZAK3D84Klf2OFvPJoJDlIdGoCvPg9dwFeW9SSrt6dqlYlM04Oa
 xXecszcmWyVKhIDVNhIGjbRnMGp/w2jo8gMeeTF9z+pWqqSXu2ijT1ivZYjc0V3w
 6W2LFI7Blk0jZ4/oyRj/0jQ2/WFeVHrDzaWbUIB7kFv1nFrQvf9J1A+7nbbREX+Z
 KnwetTxGJI4YPsNWc3zOZGIGguiDD1GD2x1ODcTCdoOQvb70SmGtr3bS0eqTFojP
 BGtmrAjd8YrB7a5r/cNw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3xm4edudpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Apr 2024 14:34:15 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E67B44002D;
 Tue, 23 Apr 2024 14:34:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1CF2C21A23A;
 Tue, 23 Apr 2024 14:33:26 +0200 (CEST)
Received: from localhost (10.48.86.143) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 14:33:25 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Date: Tue, 23 Apr 2024 14:32:53 +0200
Message-ID: <20240423123302.1550592-4-amelie.delaunay@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
References: <20240423123302.1550592-1-amelie.delaunay@foss.st.com>
MIME-Version: 1.0
X-Originating-IP: [10.48.86.143]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-23_11,2024-04-23_01,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH 03/12] MAINTAINERS: Add entry for STM32 DMA
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
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IDkwMzhhYmQ4NDExZS4uYzExNzE4
NGI3ZDI2IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMjEx
MzEsNiArMjExMzEsMTUgQEAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lp
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
