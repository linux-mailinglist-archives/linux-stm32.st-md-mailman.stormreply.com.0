Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03F285309F
	for <lists+linux-stm32@lfdr.de>; Tue, 13 Feb 2024 13:37:12 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A175FC6DD69;
	Tue, 13 Feb 2024 12:37:12 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E97D8C6C83D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Feb 2024 12:37:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41DAHOsc007195; Tue, 13 Feb 2024 13:37:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 selector1; bh=WCLzMa4S8B9LE+l6Xk7TCbMua2Sf8tUF9rmm+m0Qjlk=; b=JP
 083YBlPgUXhg+wSpAUUhfRxaA+2rpPFIKjMyywEsQGjKC3OoDajahLXEejnnThS3
 UCuV53IRKiBQRGbmqjpMEKS5Hj6qrhRKl/L02chk/IBIZGvHe+grGXItX0iXV75U
 Uzux9n048u2lwtdZnyVbY0K49kpoJuVfyCEV4J4S3X1eUkgj6ER49TEZ7fB0J/uT
 VWPM9VIElouyuuH0hFAcMwCR72T28/HW0Sn9efUzR9zGEr1jnQKe+6GPt0CiboTC
 j4I931v4D0ATAB61a5SRtR06Mwj2TUIjEFaxs2CFuYAoVs7NmxVtFS2KIr4rB8Gq
 g9K5KW58Js2lWPD1k0Yw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3w6kk4rgpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Feb 2024 13:37:03 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4E49240044;
 Tue, 13 Feb 2024 13:36:59 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 988B723D407;
 Tue, 13 Feb 2024 13:36:17 +0100 (CET)
Received: from [10.201.22.200] (10.201.22.200) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 13 Feb
 2024 13:36:16 +0100
Message-ID: <18ec4d01-717e-440b-bc54-8652fb68965e@foss.st.com>
Date: Tue, 13 Feb 2024 13:36:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>
References: <20240212174822.77734-1-christophe.kerello@foss.st.com>
 <20240212174822.77734-6-christophe.kerello@foss.st.com>
 <6bc91742-66d8-425b-ba40-fe5fa6ba18c4@linaro.org>
From: Christophe Kerello <christophe.kerello@foss.st.com>
In-Reply-To: <6bc91742-66d8-425b-ba40-fe5fa6ba18c4@linaro.org>
X-Originating-IP: [10.201.22.200]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
Cc: devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH 05/12] memory: stm32-fmc2-ebi: update the
 driver to support revision 2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>



On 2/13/24 08:46, Krzysztof Kozlowski wrote:
> The function is not really readable anymore. Please split it into three
> functions: for v1 (so original code), v2 and wrapper choosing it based
> on revision). Or two functions and some sort of ops with function
> pointers (so you call ops->check_clk_period). Or just parametrize the
> registers with two different "struct reg_field" and use appropriate one
> for given revision (the code looks the same!)
> Or just two set of stm32_fmc2_child_props...
> 
> Anyway the duplicated code just two read different register is it not
> the way to go.

Hi Krzysztof,

As I said in patch 4, I am going to rewrite this patch and I am going to
use the platform data to distinguish between each variant instead of
checking the IP revision.

Regards,
Christophe Kerello.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
