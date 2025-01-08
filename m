Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D614A05BEA
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 13:46:47 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1C978C78032;
	Wed,  8 Jan 2025 12:46:47 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id C9686C78022
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  8 Jan 2025 12:46:39 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5089S7TW008396;
 Wed, 8 Jan 2025 13:46:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=k/Owhr//HyiKIqL7/U5rQbAg
 BbQdC2z3Ac5xKTuO6zs=; b=u+222eb6IRU84rOdobLv4zvXbz9vCeYzMO/OV/NT
 Z1w+sXnsAJoRJeR53GkDlCRiiDhAbZIt5F2QU91gKvzgvD04NfOUObaMvf0p1Wdv
 3en+DH04GTdWX82bzf2HmN97+B+pvaonsbur68tyZAt56P8QF3KGUMKXiDFtpGrw
 Ml/N0zVkDZFbKOutfjSrSFoQOUYE5wgXoOd4FCGiYI5DP4Z4OdYY2bqrhR4c2UWy
 EjDacST5H03g6pFev/AXpgVJdAEKndj4RNAsRzeDRQLkZbjpeAmX9uoeN9I6wA+A
 ZUYKeNfGl5d2xSeNP9PEmTwLD8NJyyhOxaUENOLdrvvByA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 441m7t9gj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jan 2025 13:46:18 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2403440044;
 Wed,  8 Jan 2025 13:45:11 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 591DE262B18;
 Wed,  8 Jan 2025 13:42:12 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Wed, 8 Jan
 2025 13:42:11 +0100
Date: Wed, 8 Jan 2025 13:42:06 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <20250108124206.GA153605@gnbcxd0016.gnb.st.com>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
 <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
 <20241218-yelling-palm-da676b67afb9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241218-yelling-palm-da676b67afb9@spud>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 2/9] dt-bindings: media: clarify stm32 csi
 & simplify example
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

Hi Conor,

On Wed, Dec 18, 2024 at 06:25:11PM +0000, Conor Dooley wrote:
> On Tue, Dec 17, 2024 at 09:12:55PM +0000, Sakari Ailus wrote:
> > Hi Conor,
> > 
> > On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> > > On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > > > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > > > D-PHY.
> > > 
> > > > Remove the bus-type property from the example.
> > > 
> > > Why? What's there to gain from the example being (seemingly?) less
> > > comprehensive?
> > 
> > As the device has D-PHY, other options are excluded. I.e. that property is
> > redundant for this device.
> 
> That should be mentioned in the commit message.

Ok, I'll push a v2 with that commit message fixed.

Alain


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
