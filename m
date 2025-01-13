Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F03C6A0B1DE
	for <lists+linux-stm32@lfdr.de>; Mon, 13 Jan 2025 09:58:11 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 96312C78024;
	Mon, 13 Jan 2025 08:58:11 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 1B53CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 13 Jan 2025 08:58:10 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50D2hToA027841;
 Mon, 13 Jan 2025 09:57:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=NA98flkcRX3iZq22t3Nzla7Q
 gw0N/tZv3BerTN5QpRs=; b=Cd3ZP5WHPIQx17atCrPy4B0yuH3aCTB4x4xT3QZ2
 y2hx9rillYCNvM1vjOshKXxouzn/wIGNNDXIr1bUD52EPzolT23JsMA6VBd9w/6G
 0tY1E+YycgCIF9p5L/rsGy7CM4otx1Gx1YSfdG09Pg/WDecm+q8Z4Az5pFCCNTex
 cVolpq/52va72AkJbslde9nauF99o8D6zc5gDS+seijPYufoyqNEfUJhMmWq4rcq
 zm9On8B+okBsTK3rA9cc2yaRiQ86T0dVWtwNv9Wr2XeqaqHnQgzxqttXvO4L5IXG
 OdfyaSeGyrelFUN0MRY0G3Gxcjk1zVHV239DawKgy/mbBQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 444t9x1530-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jan 2025 09:57:55 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2E37740045;
 Mon, 13 Jan 2025 09:56:46 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B7AF4234551;
 Mon, 13 Jan 2025 09:55:58 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Mon, 13 Jan
 2025 09:55:58 +0100
Date: Mon, 13 Jan 2025 09:55:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Message-ID: <20250113085529.GA499619@gnbcxd0016.gnb.st.com>
References: <20250108-csi_dcmipp_mp25_enhancements-v2-0-05808ce50e41@foss.st.com>
 <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4DVj9ubGkAmkZKN@kekkonen.localdomain>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH v2 0/8] media: stm32: csi / dcmipp
	corrections
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

Hi Sakari,

On Fri, Jan 10, 2025 at 08:08:47AM +0000, Sakari Ailus wrote:
> Hi Alain,
> 
> On Wed, Jan 08, 2025 at 02:16:03PM +0100, Alain Volmat wrote:
> > Various fixes within the stm32 csi bindings/drivers and
> > stm32 dcmipp driver.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> 
> Thanks for the update. I tried to apply this but it doesn't, and the
> culprit appears to be this line in dcmipp_graph_notify_bound():
> 
> 	unsigned int ret;
> 
> That appears to be a bug as such. The interesting thing is that the patch
> changing things around it presumes
> 
> 	int ret;
> 
> so it won't apply. Do you already have a patch that fixes it? It should be
> cc'd to stable, too, with a Fixes: tag.

Apologies for that, I might have made a mistake while rebase and somehow
a patch went before the b4 header commit. Pushing again a v3 with the
missing commit added.

Regards,
Alain
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
