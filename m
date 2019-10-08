Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DFBCF5DE
	for <lists+linux-stm32@lfdr.de>; Tue,  8 Oct 2019 11:19:44 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id DA86DC36B0C;
	Tue,  8 Oct 2019 09:19:43 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id A00E0C36B0A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  8 Oct 2019 09:19:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 x9896vYO029256; Tue, 8 Oct 2019 11:19:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=STMicroelectronics;
 bh=+dIaoBBTtn4uHC1StIa2tJsqayvUf706bDI0ytKEsoQ=;
 b=wyAuzEqHkJDYghX8QiCFEQ3qmQ4nTDmJgaRsWqJlTl3KHd3+t8044muCxJpj+JJ3aWaa
 +ZSOQbRypNhpmPawY7gUjvalZ+XtbVrZC9QpkQWn27pL3QTr9KGKuxNeSd1MOeI8XV6V
 24zi3E9StYi8g1KXwYsmMvfil8htnR2J66mZrP9S0QUcw/z3LgwBP1w1wyUQkkg5N8QL
 gYzn1T+bw/etbqs929qWjVORSLFfjPPSFluu9cNs+k1FkZoNVkcEXHP/jpHJc5cYeokN
 ucWhESkKmHzUTSbuiH1IhtuPZzfVj+xF85jqvMnwWsvkTpfJf9nhwtyhR+MnXFWnmm0/ qQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx08-00178001.pphosted.com with ESMTP id 2vej2p7csb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2019 11:19:26 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE24010002A;
 Tue,  8 Oct 2019 11:19:24 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A147A2B1E48;
 Tue,  8 Oct 2019 11:19:24 +0200 (CEST)
Received: from SFHDAG5NODE1.st.com (10.75.127.13) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 8 Oct
 2019 11:19:24 +0200
Received: from SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6]) by
 SFHDAG5NODE1.st.com ([fe80::cc53:528c:36c8:95f6%20]) with mapi id
 15.00.1473.003; Tue, 8 Oct 2019 11:19:24 +0200
From: Gerald BAEZA <gerald.baeza@st.com>
To: Jonathan Corbet <corbet@lwn.net>
Thread-Topic: [PATCH] Documentation: add link to stm32mp157 docs
Thread-Index: AQHVXNGu+WgWi0gJwE+sfJwWkTflzacPHSFxgDnL12CABoSfAIABS0jA
Date: Tue, 8 Oct 2019 09:19:24 +0000
Message-ID: <70e865409cab4d589323692e863dbc49@SFHDAG5NODE1.st.com>
References: <1566908347-92201-1-git-send-email-gerald.baeza@st.com>
 <20190827074825.64a28e88@lwn.net>
 <5257eff7-418b-8e94-1ced-30718dd3f5dc@st.com>
 <8d097a0486e94257952600bf6d20975d@SFHDAG5NODE1.st.com>
 <20191007093208.757554b0@lwn.net>
In-Reply-To: <20191007093208.757554b0@lwn.net>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.45]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
 definitions=2019-10-08_03:2019-10-07,2019-10-08 signatures=0
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [PATCH] Documentation: add link to stm32mp157 docs
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

Hi Jonathan

> From: Jonathan Corbet <corbet@lwn.net>
> 
> On Thu, 3 Oct 2019 10:05:46 +0000
> Gerald BAEZA <gerald.baeza@st.com> wrote:
> 
> > > > Adding the URL is a fine idea.  But you don't need the extra
> > > > syntax to create a link if you're not going to actually make a link out of it.
> > > > So I'd take the ".. _STM32MP157:" part out and life will be good.
> > > >
> > >
> > > We also did it for older stm32 product. Idea was to not have the "full"
> > > address but just a shortcut of the link when html file is read. It
> > > maybe makes no sens ? (if yes we will have to update older stm32
> > > overview :))
> >
> > Example in
> > https://www.kernel.org/doc/html/latest/arm/stm32/stm32h743-
> overview.ht
> > ml
> >
> > Do you agree to continue like this ?
> 
> If you actually use the reference then it's OK, I guess; in the posted
> document that wasn't happening.  I still think it might be a bit more
> straightforward to just put the URL; that will make the plain-text file a little
> more readable.  In the end, though, it's up to you, go with whichever you
> prefer.

So I prefer to keep the patch as it, for better consistency with the others stm32 overviews.
Thank you.

> 
> Thanks,
> 
> jon
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
