Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EC59DD2D78
	for <lists+linux-stm32@lfdr.de>; Thu, 10 Oct 2019 17:16:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D9862C36B0C;
	Thu, 10 Oct 2019 15:16:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 8D101C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 10 Oct 2019 15:16:41 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9AFBKhQ025036; Thu, 10 Oct 2019 17:16:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=WdF442jlxXHtW99D7VXviowbwCBFKKqETJKUfQQ750w=;
 b=mm2aIehas26Nib8HsLOMFdpsO23R7o8VnUJ+GWdEZjSLZR9ZOFAHky36iI4Br1lxJ3Sk
 avwn9mmM/xIpqctgJhEm9dhtDoAAVur2AUA24mzmir1bc7GfdSSENlTsoxZSjM1Hwdhc
 Y9/ElLzy6dDdBMiJdyB5L0mLKFzGbnEPa5jMvbKMsKX5r6+Bfg/UXc6AmbV6JqTQO4AY
 8Jklj38blZDBAAgFPOruDqxcjSdUcSJEi4/Uo81ZOOIsbQpsCxarYtqW4GV0lYAl2b/e
 mDwA9H2Ajdi8ApxoA9I0ppL9aM69bXJCPv2By43adSY7PAYuJiqsDgbVSOi3MgUE7bl7 3g== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2pmt2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Oct 2019 17:16:20 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 40B5A10002A;
 Thu, 10 Oct 2019 17:16:19 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag7node2.st.com [10.75.127.20])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9391E2B433F;
 Thu, 10 Oct 2019 17:16:19 +0200 (CEST)
Received: from SFHDAG5NODE3.st.com (10.75.127.15) by SFHDAG7NODE2.st.com
 (10.75.127.20) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Oct
 2019 17:16:19 +0200
Received: from SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47]) by
 SFHDAG5NODE3.st.com ([fe80::7c09:5d6b:d2c7:5f47%20]) with mapi id
 15.00.1473.003; Thu, 10 Oct 2019 17:16:19 +0200
From: Fabien DESSENNE <fabien.dessenne@st.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE
 <alexandre.torgue@st.com>, Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
 <linux-remoteproc@vger.kernel.org>
Thread-Topic: [PATCH 0/2] remoteproc: stm32: allow wdg irq to be a wakeup
 source
Thread-Index: AQHVXCRbzfqre7GQVUu6MRQERXnqfqdUQtwQ
Date: Thu, 10 Oct 2019 15:16:19 +0000
Message-ID: <1bef12295e864dfa90edfa495803167f@SFHDAG5NODE3.st.com>
References: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1566833923-16718-1-git-send-email-fabien.dessenne@st.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-10_05:2019-10-10,2019-10-10 signatures=0
Subject: Re: [Linux-stm32] [PATCH 0/2] remoteproc: stm32: allow wdg irq to
 be a wakeup source
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hi

I Got Rob's Reviewed-by for the bindings. Any further comments for the driv=
er part?

Fabien

> -----Original Message-----
> From: Fabien DESSENNE <fabien.dessenne@st.com>
> Sent: lundi 26 ao=FBt 2019 17:39
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>;
> Maxime Coquelin <mcoquelin.stm32@gmail.com>; Alexandre TORGUE
> <alexandre.torgue@st.com>; Ohad Ben-Cohen <ohad@wizery.com>; Bjorn
> Andersson <bjorn.andersson@linaro.org>; devicetree@vger.kernel.org; linux-
> stm32@st-md-mailman.stormreply.com; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; linux-remoteproc@vger.kernel.org
> Cc: Fabien DESSENNE <fabien.dessenne@st.com>; Loic PALLARDY
> <loic.pallardy@st.com>; Arnaud POULIQUEN <arnaud.pouliquen@st.com>
> Subject: [PATCH 0/2] remoteproc: stm32: allow wdg irq to be a wakeup sour=
ce
> =

> The watchdog IRQ which notifies the remote processor crash is used by the
> remoteproc framework to perform a recovery procedure.
> Since this IRQ may be fired when the Linux system is suspended, this IRQ =
may
> be configured to wake up the system.
> =

> Fabien Dessenne (2):
>   dt-bindings: remoteproc: stm32: add wakeup-source
>   remoteproc: stm32: wakeup the system by wdg irq
> =

>  .../devicetree/bindings/remoteproc/stm32-rproc.txt |  3 ++
>  drivers/remoteproc/stm32_rproc.c                   | 47 ++++++++++++++++=
++++++
>  2 files changed, 50 insertions(+)
> =

> --
> 2.7.4

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
