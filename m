Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id A95AE9BC737
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Nov 2024 08:45:49 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7407EC6DD9F;
	Tue,  5 Nov 2024 07:45:49 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 56B11C6DD9E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Nov 2024 07:45:48 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5135JP023435;
 Tue, 5 Nov 2024 08:45:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=selector1; bh=agzLPwjtyIVcmji+qBbiwXvd
 NNXbwTGcuXy/vqd4v6s=; b=vobLQDZD2qNGcCFGeAPMOcHK1jX8XoKA7p8EXbY1
 K7TkP1GZ/Fzwiy/clo5SiJKmvNeb6qiX5w3W/3e6ZxBG5qODvF508afDzJqHD0tc
 LrZOPaZCFE1c5SaMzhYqES3dZrBn9vofv553ZFRnQS0xauUrqqIzPwRPjQqPDTwM
 2TFw89arm5o/X1LQUrsIa5ef3G6WKEr5GgMiCKtPDE37F6dV44I/iz6CCoH7ovF4
 WReqn0nR6pjMgPzFrpiKjDzG2XmdLvpaQS1IUYr85eACNf7eihE0WiTBETdLCZjE
 HzZrLAXv6VNCjPoCp3MgE4NBdxP1P3ov4vc1JBNSX2blBA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nxh3rmc6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2024 08:45:34 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id DA23B40047;
 Tue,  5 Nov 2024 08:44:19 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7DA3824F7A7;
 Tue,  5 Nov 2024 08:43:23 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:43:22 +0100
Date: Tue, 5 Nov 2024 08:43:21 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <20241105074321.GB1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-12-e3fd0ed54b31@foss.st.com>
 <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <lu252oltrh6bftg2e4hpthazd4r3lwbd75mboezhz7f4bbfdip@w5k4jx6oyyzx>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org,
 Hugues Fruchet <hugues.fruchet@foss.st.com>, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH 12/15] dt-bindings: media: addition of
 stm32mp25 compatible of DCMIPP
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

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:41:59PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:14PM +0200, Alain Volmat wrote:
> > Addition of the stm32mp25 compatible for the DCMIPP.
> 
> "Add"
> See submitting patches.

Commit message corrected in the v2.

> 
> > The stm32mp25 distinguish with the stm32mp13 by the fact that:
> >  - supports also csi inputs in addition to parallel inputs
> >  - requires an addition csi clock to be present
> > 
> > The commit also adds access-controllers, an optional property that
> 
> "Add", see submitting patches.

Here as well.

> 
> > allows a peripheral to refer to one or more domain access controller(s).
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  .../devicetree/bindings/media/st,stm32-dcmipp.yaml | 53 +++++++++++++++++++---
> >  1 file changed, 47 insertions(+), 6 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > index 87731f3ce7bd..bda28fef0b78 100644
> > --- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > +++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
> > @@ -10,9 +10,40 @@ maintainers:
> >    - Hugues Fruchet <hugues.fruchet@foss.st.com>
> >    - Alain Volmat <alain.volmat@foss.st.com>
> >  
> > +allOf:
> 
> Please put allOf: like in example schema, so after required:.

Done in v2.

> 
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> 
> Best regards,
> Krzysztof
> 
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
