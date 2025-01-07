Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E28A03D3A
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2025 12:06:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D18FFC78022;
	Tue,  7 Jan 2025 11:06:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2B7D3C78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 11:06:00 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5079JpOV026708;
 Tue, 7 Jan 2025 12:05:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 93Rb+Ogkxz3F4UcRyaPH1HS1f7gZEjIEkrgdACGwwuk=; b=mh2QRgB08IDXzC+U
 BmwYIOLcWK0qAYMBVvbB87uoyS7SXLCjlj16b+tYqXXXFVvZ0oriOtPMVYsgl7uW
 /DzkR2boobP8NnBRkxVnAOV8nTD/3k8JB5W4QjqDbyrU0byRGsQPHJM1d8i8g6q8
 w/8qjrs0sYRSwTvcivKVbbg1O5dilr1y+6iSEORwCYolIqiAZO+MhxnJKruMzZi/
 WFndIvLr0p/gK3dHaESlCOBaFyX2DdT0kuUBh6IsAB8lXSVF/rvWyC8XHhpOLsh5
 RuIEaz8HdHKeMBMMpOkMwUWHv1PyRBYfTjPt93HFJpTouK5R+ODDU+RWMfs3sXGA
 zLOGZQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4410vgrrxm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2025 12:05:36 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5756C40048;
 Tue,  7 Jan 2025 12:04:30 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 112D22649E9;
 Tue,  7 Jan 2025 12:03:47 +0100 (CET)
Received: from [192.168.8.15] (10.48.86.148) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 7 Jan
 2025 12:03:46 +0100
Message-ID: <2f37dd23a4bf04c5c66aa193c6604f24a5f59011.camel@foss.st.com>
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mingwei Zheng <zmw12306@gmail.com>
Date: Tue, 7 Jan 2025 12:03:43 +0100
In-Reply-To: <20250106220659.2640365-1-zmw12306@gmail.com>
References: <20250106220659.2640365-1-zmw12306@gmail.com>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-Originating-IP: [10.48.86.148]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: marex@denx.de, peng.fan@nxp.com, make24@iscas.ac.cn,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jiasheng Jiang <jiashengjiangcool@gmail.com>,
 fabien.dessenne@foss.st.com, mcoquelin.stm32@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v10] pinctrl: stm32: Add check for
	clk_enable()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

On Mon, 2025-01-06 at 17:06 -0500, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
> ---
> Changelog:
> 
> v9 -> v10:
> 1. Move the id assignment into pctl->clks[i].clk assignment loop.
> 2. Remove empty lines.

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks!
Antonio
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
