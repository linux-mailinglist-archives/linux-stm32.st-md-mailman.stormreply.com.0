Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA9E4AC412
	for <lists+linux-stm32@lfdr.de>; Mon,  7 Feb 2022 16:45:43 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2524C60489;
	Mon,  7 Feb 2022 15:45:42 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5E0DDC5AB61
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  7 Feb 2022 15:45:41 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2177xPBw022448;
 Mon, 7 Feb 2022 11:51:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=K0w0XBABzulMwdabSun+EYASobtFwjzKISn9qecxuPY=;
 b=k3lqLLAw5FZoLfGG2L+upiMxtNrtpMVu5eJRO4IXtjDPbTah91Kl0YEEEw42PuQWzddD
 iunHYyNKNosVbIvPYJc8poGbeVX3jV3KrfHTx3omp+jo+oYifplTOUz3a5PNIHip9ECo
 di8nWjQPYkmOIrOZa+W+RoKZfTFYQWTdSEPot+z8e3QgHzNs8+UCQY8C2YaO9StgkqIM
 heGAjJv9tNFhLKbM35juaSCV/rJw9Mp7Mc9NY+1s302Ru7y2ZIVvScBbvKbgSpeVpMAs
 fWc8WaEwW2WjC4Jq1xHL9+uPqhJf248Lpu6H8z1dr1c7cg+WSnR2PIjtdKypsd6HzATq 0A== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3e2nfyaxev-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 11:51:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 66E7D100039;
 Mon,  7 Feb 2022 11:51:16 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4CA2E216EDA;
 Mon,  7 Feb 2022 11:51:16 +0100 (CET)
Received: from [10.48.0.252] (10.75.127.45) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.26; Mon, 7 Feb
 2022 11:51:15 +0100
Message-ID: <c501d583-4293-5781-8ddd-b1d317460b05@foss.st.com>
Date: Mon, 7 Feb 2022 11:51:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Dillon Min <dillon.minfei@gmail.com>, <mchehab@kernel.org>,
 <mchehab+huawei@kernel.org>, <hverkuil-cisco@xs4all.nl>,
 <ezequiel@collabora.com>, <gnurou@gmail.com>, <pihsun@chromium.org>,
 <mcoquelin.stm32@gmail.com>, <mturquette@baylibre.com>,
 <sboyd@kernel.org>, <robh+dt@kernel.org>, <gabriel.fernandez@st.com>,
 <gabriel.fernandez@foss.st.com>
References: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <1635232282-3992-1-git-send-email-dillon.minfei@gmail.com>
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_01,2021-12-02_01
Cc: devicetree@vger.kernel.org, kbuild-all@lists.01.org, lkp@intel.com,
 hugues.fruchet@foss.st.com, llvm@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v7 00/10] Add support for DMA2D of
 STMicroelectronics STM32 Soc series
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

Hi Dillon

On 10/26/21 09:11, Dillon Min wrote:
> This patchset introduces a basic support for DMA2D Interface
> of STMicroelectronics STM32 SoC series.
> 
> This first basic support implements R2M, M2M, M2M_PFC
> M2M_BLEND support will be added later on.
> 
> This has been tested on STM32469-DISCO board.
> 

...

ARM DT patches ([3][4]) applied on stm32-next.

Thanks
Alex

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
