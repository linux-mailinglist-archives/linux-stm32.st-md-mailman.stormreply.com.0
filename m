Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D00EB53B688
	for <lists+linux-stm32@lfdr.de>; Thu,  2 Jun 2022 12:04:07 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 8C9DEC03FE0;
	Thu,  2 Jun 2022 10:04:07 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BD665C03FC1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  2 Jun 2022 10:04:05 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25284Kim018004;
 Thu, 2 Jun 2022 12:03:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=m0BCmY6bXRbzWS6fl2Ve4Vs/Ccc1sRTGBDBIBXY+c6I=;
 b=WuSnLnG4D/Nyv0VWP2j0eZCiGe4+MtuCxmfGBXIjUuT300iA5DMyBu16vgOYMMXyuzVZ
 /wQJJN9wdjxKbCkgows4BOhXmAhImz6jd1ozt1CVmbruf6v0PEyy0mCAIWf9rOrV8Ys8
 O8AHt1liciMBHMmpD/YyaGwY/O8Rndmcv1ovlDCsScNq8Cbg73Qcm/mdJNV0oeVqVP3h
 8nY9oQRFPcE5npbIjJWu6zG0ifPk9Rw0/CP/B9YGDBnQC1Hl/tRE6jCrO0GyWAb3EDIz
 hGEouAukzQj+qjQKmiDUd9P4ZAfsdQecyTUlRvPo8wdzsDwCOQlKGQqMC+dqeWcTc6Nu Sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3gbc2vy4kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jun 2022 12:03:52 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A7BFB10003A;
 Thu,  2 Jun 2022 12:03:51 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2432E21A20C;
 Thu,  2 Jun 2022 12:03:51 +0200 (CEST)
Received: from [10.211.11.162] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 2 Jun
 2022 12:03:50 +0200
Message-ID: <63e621b9-78e8-e53c-21dc-b1011ea2a15b@foss.st.com>
Date: Thu, 2 Jun 2022 12:03:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
References: <20220602085918.350613-1-patrice.chotard@foss.st.com>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20220602085918.350613-1-patrice.chotard@foss.st.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-02_01,2022-02-23_01
Cc: linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 0/2] spi: stm32-qspi: Remove unused
	parameters
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

A v2 as been sent, as a patch was missing

PAtrice

On 6/2/22 10:59, patrice.chotard@foss.st.com wrote:
> From: Patrice Chotard <patrice.chotard@foss.st.com>
> 
> This series cleans up spi-stm32-qspi driver by removing unused parameters
> 
> Patrice Chotard (2):
>   spi: stm32-qspi: Remove stm32_qspi_get_mode() unused parameter
>   spi: stm32-qspi: Remove stm32_qspi_wait_cmd() unused parameter
> 
>  drivers/spi/spi-stm32-qspi.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
