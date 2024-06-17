Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9AD90A970
	for <lists+linux-stm32@lfdr.de>; Mon, 17 Jun 2024 11:21:58 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1202AC6B45B;
	Mon, 17 Jun 2024 09:21:58 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 6C0AFC69067
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 17 Jun 2024 09:21:57 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H8NbYK024552;
 Mon, 17 Jun 2024 11:21:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=selector1; bh=
 bkqtW5boQBwGGmqqfn5zcA8qz6TEdI+y48zQPPaL2AU=; b=HR54fhnVCjuk6R+2
 cQtIv0ZfDKC/oquzi855xdMZVQ+xFfpyb7WXmKSYeR2fvtCWO91cqYgf7wgUuq0K
 kxsOfHgreUv2EkCbhmNpswvkL+HibIKzBAPcl27EZONaX2YO1cFsrlQ2S08EfGyV
 uedUeOGs9q/doVR0XwgMLuZFNtkAAyKBEns4WyAOIkAvDEkqDzp/INo132i699fp
 oea3C4iFcx7HFVjZRsHZiPy6T/SRWi5R83FyHWlY0YO6aHjcMwK2rBzg7tYHxODn
 kDvCY71cVbNIA98So+7+xpQcSrko8Lts3mSS8GqqPNiolgKfvOQHQ/8GnyVrajwk
 CmkGMQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3ys0cg603y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Jun 2024 11:21:47 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 5A4D14002D;
 Mon, 17 Jun 2024 11:21:42 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E4C4F21161C;
 Mon, 17 Jun 2024 11:21:13 +0200 (CEST)
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 17 Jun
 2024 11:21:13 +0200
Received: from SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0]) by
 SHFDAG1NODE1.st.com ([fe80::b848:dbeb:cd0:84a0%13]) with mapi id
 15.01.2507.035; Mon, 17 Jun 2024 11:21:13 +0200
From: Etienne CARRIERE - foss <etienne.carriere@foss.st.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Thread-Topic: [PATCH v2] dt-bindings: mfd: dual licensing for st,stpmic1
 bindings
Thread-Index: AQHawJeUU3NnSMssbUG+9ayDKPGp5rHLriid
Date: Mon, 17 Jun 2024 09:21:13 +0000
Message-ID: <15b20cdd8b9148559352fdb2f02e4e53@foss.st.com>
References: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
In-Reply-To: <20240617092016.2958046-1-etienne.carriere@foss.st.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.86.128]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_08,2024-06-14_03,2024-05-17_01
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Lee Jones <lee@kernel.org>, Pascal PAILLET-LME <p.paillet@st.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [Linux-stm32] [PATCH v2] dt-bindings: mfd: dual licensing for
 st, stpmic1 bindings
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

Hello Conor,

>
> From: Conor Dooley <conor@kernel.org>
> Sent: Saturday, June 15, 2024 2:14 PM
>
> On Fri, Jun 14, 2024 at 05:33:46PM +0200, Etienne Carriere wrote:
> > Change include/dt-bindings/mfd/st,stpmic1.h license model from GPLv2.0
> > only to dual GPLv2.0 or BSD-3-Clause. I have every legitimacy to request
> > this change on behalf of STMicroelectronics. This change clarifies that
> > this DT binding header file can be shared with software components as
> > bootloaders and OSes that are not published under GPLv2 terms.
> >
> > In CC are all the contributors to this header file.
> >
> > Cc: Pascal Paillet <p.paillet@st.com>
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > ---
> >  include/dt-bindings/mfd/st,stpmic1.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/mfd/st,stpmic1.h b/include/dt-bindings/mfd/st,stpmic1.h
> > index 321cd08797d9..957c48300cd4 100644
> > --- a/include/dt-bindings/mfd/st,stpmic1.h
> > +++ b/include/dt-bindings/mfd/st,stpmic1.h
> > @@ -1,4 +1,4 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-3-Clause */
>
> The usual dual license for bindings is BSD-2-Clause, was there a
> specific request for the 3 version?

My mistake. Thanks for spotting that.
I have my company agreement for the 2 dual models: "OR BSD-2-Clause" and "OR BSD-3-Clause".
We expect to conform to DT bindings preferred licensing model. Indeed the kernel documentation explicitly mention "GPL-2.0-only OR BSD-2-Clause".
We prefer to conform with it. I'll update my patch.

By the way, I'll fix Lee Jones e-mail address that is deprecated.

BR,
Etienne


>
> >  /*
> >   * Copyright (C) STMicroelectronics 2018 - All Rights Reserved
> >   * Author: Philippe Peurichard <philippe.peurichard@st.com>,
> > --
> > 2.25.1
> >
>
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
