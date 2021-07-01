Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CAB3B8F1D
	for <lists+linux-stm32@lfdr.de>; Thu,  1 Jul 2021 10:51:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 0BB96C597AE;
	Thu,  1 Jul 2021 08:51:46 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B914CC59781
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  1 Jul 2021 08:51:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1618gpRq027678; Thu, 1 Jul 2021 10:51:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 h=date : from : to :
 cc : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=selector1; bh=vtkNmwsSYfkYlSTI8h9TA+PQPEL6nyCvhM4AHGuOwbY=;
 b=TF8U8qsXDNoAW6+m9V7EQvfGWsZdPsQ6PYZ9IHkZ5GBk7SSnjtUgqml/hnF+sNm7ZSiz
 rw6WUv8gtcbN+CuQGy9BlYDjBg/8l2bAxQDuKr6VLO7PTh4LEXlZTI+vqb13RVpBcR3q
 z23YdRpyDQZBHLMpANaRVYjY6H6JS3Wn7zaUOR//DJ9qd5u29oHxrNp+jogkdK+rYp1q
 jqH9pRfOOMQdaYkWzLBqOaHPXK+6bShBgN0N8DQ402ptiHLusossUrgrG2Z6wHlTHAoF
 bJb4XzaKqTj2yvVwgcDa8l08+QbwR8pmXjPu11ax6Le6qXZxjTpnr16/pzONXtr6oeoO DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 39h7yj28s9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 01 Jul 2021 10:51:33 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B3BFF10002A;
 Thu,  1 Jul 2021 10:51:32 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9F909212ABF;
 Thu,  1 Jul 2021 10:51:32 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.75.127.48) by SFHDAG2NODE3.st.com
 (10.75.127.6) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 1 Jul
 2021 10:51:32 +0200
Date: Thu, 1 Jul 2021 10:51:25 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: <wsa@kernel.org>, <pierre-yves.mordret@foss.st.com>
Message-ID: <20210701085125.GA28021@gnbcxd0016.gnb.st.com>
Mail-Followup-To: wsa@kernel.org, pierre-yves.mordret@foss.st.com,
 alexandre.torgue@foss.st.com, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 fabrice.gasnier@foss.st.com, amelie.delaunay@foss.st.com
References: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1625062303-15327-1-git-send-email-alain.volmat@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-01_06:2021-06-30,
 2021-07-01 signatures=0
Cc: linux-kernel@vger.kernel.org, alexandre.torgue@foss.st.com,
 linux-i2c@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 0/3] i2c: stm32f7: several fixes in error
	cases
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

Hi,

please put this on hold for the moment as I might have found an issue
with one patch.
Sorry for the noise.

Regards,
Alain

On Wed, Jun 30, 2021 at 04:11:40PM +0200, Alain Volmat wrote:
> This serie provides several fixes needed for cases when communication
> when a device is not behaving properly.
> 
> Alain Volmat (3):
>   i2c: stm32f7: recover the bus on access timeout
>   i2c: stm32f7: flush TX FIFO upon transfer errors
>   i2c: stm32f7: prevent calling slave handling if no slave running
> 
>  drivers/i2c/busses/i2c-stm32f7.c | 31 +++++++++++++++++++++++++++----
>  1 file changed, 27 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
