Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9196847D
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 09:39:41 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 823ECC930DC
	for <lists+linux-stm32@lfdr.de>; Mon, 15 Jul 2019 07:39:41 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id B08B6C7B4EC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 15 Jul 2019 07:39:36 +0000 (UTC)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6F7au0k024443; Mon, 15 Jul 2019 09:39:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=HpVUgrShAgW9vXsEQTQa0RY6pPTPY9FAz9k7Q5LwFKg=;
 b=ifB0nituf9QfJe/DA2FY/drpX/1PbUubcs4dYlZU/B3AgwOG/263reAdB/BBsBE5Hfpk
 3c+j8avUhJyCCwY7msrRFQ95xaumfsuymFpXwQM7Kgn039HGwa/a9oEfRvfWXbnw22Ra
 +q+X6cTRQb2lPccaTqk7x2iRBnwHp0cO/2HSneNCEn+s29z4bVCfzRVcEzzyYF7dFSSo
 i88rSPOB7TJ2Cucx4XcVkKD0+3jEtO3WdIf3peM2X7aAhoETdF8XhlFW3O3+pjNrbJFj
 lPXSvSs1oRaQpdE/J1v7eUa5xPLfecbl3RldgEAhTC5Nwg0h5ousvgqQXm0t8zC49kpe cw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2tq4s1c82u-1
 (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
 Mon, 15 Jul 2019 09:39:24 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BCB6441;
 Mon, 15 Jul 2019 07:39:23 +0000 (GMT)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
 by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 8A557165F;
 Mon, 15 Jul 2019 07:39:23 +0000 (GMT)
Received: from SFHDAG6NODE1.st.com (10.75.127.16) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 15 Jul
 2019 09:39:23 +0200
Received: from SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27]) by
 SFHDAG6NODE1.st.com ([fe80::8d96:4406:44e3:eb27%20]) with mapi id
 15.00.1473.003; Mon, 15 Jul 2019 09:39:23 +0200
From: Ludovic BARRE <ludovic.barre@st.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Thread-Topic: [PATCH V3 0/3] mmc: mmci: add busy detect for stm32 sdmmc variant
Thread-Index: AQHVGiTDhxYOagQ32kiKuW56aV8v5aaZnBkA///hwACACwqQAIAnAuIk
Date: Mon, 15 Jul 2019 07:39:23 +0000
Message-ID: <1563176363071.36427@st.com>
References: <1559577325-19266-1-git-send-email-ludovic.Barre@st.com>
 <5b7e1ae5-c97e-5a21-fc3e-7cc328087f04@st.com>
 <CAPDyKFrULRk=cHzVodU9aa6LDX9ip-VPHNwG7QXhmNZrMpPjGw@mail.gmail.com>,
 <CAPDyKFr_KNpNY-xgGdKXdAnmmD5OD1=wxgs2LmBAUJOn0mZwqg@mail.gmail.com>
In-Reply-To: <CAPDyKFr_KNpNY-xgGdKXdAnmmD5OD1=wxgs2LmBAUJOn0mZwqg@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.48]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-15_02:, , signatures=0
Cc: DTML <devicetree@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH V3 0/3] mmc: mmci: add busy detect for
	stm32 sdmmc variant
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

Hi Ulf

like scheduled, I send you a "gentleman ping" about this series.

Regards,
Ludo
________________________________________
De : Ulf Hansson <ulf.hansson@linaro.org>
Envoy=E9 : jeudi 20 juin 2019 15:50
=C0 : Ludovic BARRE
Cc : Rob Herring; Srinivas Kandagatla; Maxime Coquelin; Alexandre TORGUE; L=
inux ARM; Linux Kernel Mailing List; DTML; linux-mmc@vger.kernel.org; linux=
-stm32@st-md-mailman.stormreply.com
Objet : Re: [PATCH V3 0/3] mmc: mmci: add busy detect for stm32 sdmmc varia=
nt

Hi Ludovic,

On Thu, 13 Jun 2019 at 15:13, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 13 Jun 2019 at 15:02, Ludovic BARRE <ludovic.barre@st.com> wrote:
> >
> > hi Ulf
> >
> > Just a "gentleman ping" about this series.
> > I know you are busy, it's just to be sure you do not forget me :-)
>
> Thanks! I started briefly to review, but got distracted again. I will
> come to it, but it just seems to take more time than it should, my
> apologies.

Alright, so I planned to review this this week - but failed. I have
been overwhelmed with work lately (as usual when vacation is getting
closer).

I need to gently request to come back to this as of week 28, when I
will give this the highest prio. Again apologize for the delays!

Kind regards
Uffe

>
> Br
> Uffe
>
> >
> > Regards
> > Ludo
> >
> > On 6/3/19 5:55 PM, Ludovic Barre wrote:
> > > From: Ludovic Barre <ludovic.barre@st.com>
> > >
> > > This patch series adds busy detect for stm32 sdmmc variant.
> > > Some adaptations are required:
> > > -Clear busy status bit if busy_detect_flag and busy_detect_mask are
> > >   different.
> > > -Add hardware busy timeout with MMCIDATATIMER register.
> > >
> > > V3:
> > > -rebase on latest mmc next
> > > -replace re-read by status parameter.
> > >
> > > V2:
> > > -mmci_cmd_irq cleanup in separate patch.
> > > -simplify the busy_detect_flag exclude
> > > -replace sdmmc specific comment in
> > > "mmc: mmci: avoid fake busy polling in mmci_irq"
> > > to focus on common behavior
> > >
> > > Ludovic Barre (3):
> > >    mmc: mmci: fix read status for busy detect
> > >    mmc: mmci: add hardware busy timeout feature
> > >    mmc: mmci: add busy detect for stm32 sdmmc variant
> > >
> > >   drivers/mmc/host/mmci.c | 49 ++++++++++++++++++++++++++++++++++++++=
+++--------
> > >   drivers/mmc/host/mmci.h |  3 +++
> > >   2 files changed, 44 insertions(+), 8 deletions(-)
> > >
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
