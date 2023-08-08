Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4717773D88
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Aug 2023 18:19:51 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 669F9C6B469;
	Tue,  8 Aug 2023 16:19:51 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 5D748C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Aug 2023 16:19:50 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 378DH73K008247; Tue, 8 Aug 2023 18:19:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding:content-type; s=selector1; bh=NnwPmcg
 lrq4+tukAQnH18ZnoSzsFYIrbdbKThdZsRx0=; b=sYd0E9sZMiBeOUEHZQZfNz2
 32FWwUMNCEGOqKnuonvkwYRPNxZqi41OYZVESk7FIAnpIIdY1Q112aPrMtUeldCb
 n9lbhEOKA8u2x0ZSP+hpglfpPdtLgQbsSczicLSv7Imc37RXYXPwC+/XI25dcPfV
 YvQWz7BCHMKYXJxFHF8E77lmAm+OZF0zHJLxTSbusgmRHCfH+K0Wg0a5dZpW3q8n
 ivrteF26v3exqjxYmbIcfu+RsYisUp+YtxLIrYRDmbVG1c98b6RVSaCSxZru5nQb
 SVgA+H9cnsMvzZguxTZ16LFzfTAcfhl0JuP7y/MtK8aCGaoGdmx0S5nFpqxOogA=
 =
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3sbjfn2n45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Aug 2023 18:19:39 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 67F0F100061;
 Tue,  8 Aug 2023 18:19:37 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node4.st.com [10.75.129.133])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8FA61235F2C;
 Tue,  8 Aug 2023 18:19:37 +0200 (CEST)
Received: from localhost (10.201.20.168) by EQNDAG1NODE4.st.com
 (10.75.129.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Tue, 8 Aug
 2023 18:19:37 +0200
From: Valentin Caron <valentin.caron@foss.st.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 8 Aug 2023 18:19:00 +0200
Message-ID: <20230808161906.178996-1-valentin.caron@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.201.20.168]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To EQNDAG1NODE4.st.com
 (10.75.129.133)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-08_15,2023-08-08_01,2023-05-22_02
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: [Linux-stm32] [PATCH v2 0/6] serial: stm32: improve DMA pause and
	resume
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

This series improves DMA management in stm32-usart driver.

It is not recommended to switch DMAT and DMAR bits when a DMA transfer
is in progress. This is going to be replaced by dmaengine_pause or
dmaengine_resume.

stm32_usart_rx_dma_pause, stm32_usart_rx_dma_resume, stm32_usart_tx_dma_pause
and stm32_usart_tx_dma_resume functions, are all redirected to a single function,
called "stm32_usart_dma_pause_resume", that has been created to simplify dma
pause/resume.

Since v1:
- Add my Signed-off in Amelie's patch.

Amelie Delaunay (1):
  serial: stm32: synchronize RX DMA channel in shutdown

Valentin Caron (5):
  serial: stm32: avoid clearing DMAT bit during transfer
  serial: stm32: use DMAT as a configuration bit
  serial: stm32: modify parameter and rename stm32_usart_rx_dma_enabled
  serial: stm32: group dma pause/resume error handling into single
    function
  serial: stm32: replace access to DMAR bit by dmaengine_pause/resume

 drivers/tty/serial/stm32-usart.c | 307 ++++++++++++++++++-------------
 drivers/tty/serial/stm32-usart.h |   1 +
 2 files changed, 185 insertions(+), 123 deletions(-)

-- 
2.25.1

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
