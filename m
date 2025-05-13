Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F005AB5041
	for <lists+linux-stm32@lfdr.de>; Tue, 13 May 2025 11:49:45 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 4043BC7A835;
	Tue, 13 May 2025 09:49:45 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 317E7C7A833
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 May 2025 09:49:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D854pR017555;
 Tue, 13 May 2025 11:49:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 //ZVoYJE5FD18K2yMTq+UkexofBXdKxadbPDKcichro=; b=IT2YzIWZjRLdKVS9
 rlyeA1yMuLa8XBWwwcqFAxgUcIwADvUuuxavvDjRpzaEmDpI/V7NW8F1LhrVLZqX
 2gZ+f5kLliRBXV7KHmoCvfIomLp+YlegNvHTHAAtPAVxm0OMW4S9BuHOHdod6Rbi
 pM+7XKQHOuI2bVsSY8u8qDN8+h31XEPKNaEPXBHGKYokHObaxn2384Q+4Kv55OCS
 vKuIgnBAurajHWSGHl4nBm0a4LKbiVjWUxsATpr3mF+SDZBdu+/jzjWeDGliqBnR
 OiSLAeeudCEV21LJzimTxpFyigPgj9j+LtABdhFHtAPBRRL3349wOi+6EHRPCAlM
 IlhGCQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46huxab77e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 May 2025 11:49:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 02C8240056;
 Tue, 13 May 2025 11:47:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92747B43F56;
 Tue, 13 May 2025 11:47:17 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 11:47:17 +0200
Message-ID: <c4a2ccb6-b052-4cce-8bfc-26bcae2a2e2a@foss.st.com>
Date: Tue, 13 May 2025 11:47:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Mark Brown <broonie@kernel.org>
References: <20250512-b4-upstream_ospi_reset_update-v4-1-982c6f7886ef@foss.st.com>
 <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <aCHlfED7b-W0pGXY@finisterre.sirena.org.uk>
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH v4] spi: stm32-ospi: Make usage of
 reset_control_acquire/release() API
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



On 5/12/25 14:11, Mark Brown wrote:
> On Mon, May 12, 2025 at 09:01:04AM +0200, Patrice Chotard wrote:
>> As ospi reset is consumed by both OMM and OSPI drivers, use the reset
>> acquire/release mechanism which ensure exclusive reset usage.
> 
> This doesn't apply against current code, please check and resend.

Hi Mark

This patch has been submitted on top of reset tag reset-for-v6.16
due to dependency with new reset API devm_reset_control_array_get_exclusive_released().

How do you want to proceed ? Philipp can take it on its reset tree ?

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
