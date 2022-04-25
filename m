Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C582750D9CE
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 08:56:02 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6AD31C5F1F2;
	Mon, 25 Apr 2022 06:56:02 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id BE790C5A4FE
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Apr 2022 06:56:01 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P5rMFd025856;
 Mon, 25 Apr 2022 08:55:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : from : subject : to : cc : content-type :
 content-transfer-encoding; s=selector1;
 bh=0SdYLOF+1V55i9K1AQg2apZ88tBoNUANJdLqqXDpzMU=;
 b=GEzTnr0SXgcEZjAytVJegsjmn12TTvSvXaVryFEJkwd7hAmZ16NU9C6CAQ8VEvtZFMQK
 bnYi/oJRODHjvgJFOU7X6xDhHkv3rNBePL/iqHDdAqANaTWB03Td6LQPOIyuuCrd7O3K
 wa8voCsO5zXahZEnNoWQub9MPsqa2tkVjGuz+nSrMKXOII89OG7+gRQyaNigV43fcGCU
 rmA3mdTTCkkj0z6P9DQ2M3syO1+ux34PTOfoLovEMw3NCq982ECkMh8gasI5bGWlYsDs
 3prdvDagrt5IHH51SS5fAtD7lXmu2SjZgDYTk5Ih7HZ9dDRFeU3cLJB/J5fysmQol752 vQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fm8t1f2um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Apr 2022 08:55:47 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1B44110002A;
 Mon, 25 Apr 2022 08:55:45 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7EDAB2122F4;
 Mon, 25 Apr 2022 08:55:45 +0200 (CEST)
Received: from [10.201.21.201] (10.75.127.48) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 25 Apr
 2022 08:55:45 +0200
Message-ID: <3a4eef1b-4959-b71a-0170-7cce21de4428@foss.st.com>
Date: Mon, 25 Apr 2022 08:55:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
To: <song@kernel.org>, <hch@lst.de>, <riel@surriel.com>
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-25_02,2022-04-22_01,2022-02-23_01
Cc: linux-stm32@st-md-mailman.stormreply.com,
 Alexandre TORGUE <alexandre.torgue@st.com>
Subject: [Linux-stm32] Compilation issue with v5.18-rc1 tag using
	stm32_defconfig
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

Hi all

There is a compilation issue with v5.18-rc4 tag using stm32_deconfig:

  MODINFO modules.builtin.modinfo
  GEN     modules.builtin
  LD      .tmp_vmlinux.kallsyms1
arm-none-eabi-ld: warning: -z norelro ignored
arm-none-eabi-ld: mm/page_alloc.o: in function `alloc_large_system_hash':
page_alloc.c:(.init.text+0xe86): undefined reference to `vmalloc_huge'
Makefile:1158: recipe for target 'vmlinux' failed
make: *** [vmlinux] Error 1

The faulty commit is f2edd118d02d ("page_alloc: use vmalloc_huge for large system hash")

Thanks

Patrice
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
