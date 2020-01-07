Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E1B132233
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 10:23:25 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B1403C36B0B;
	Tue,  7 Jan 2020 09:23:25 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [62.209.51.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id E09D1C36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 09:23:24 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0079HUtg001703; Tue, 7 Jan 2020 10:22:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=STMicroelectronics;
 bh=xFQQE6kgeKNO6UlYOlui/VsGLZg0eOZacGJld0hOGcs=;
 b=xbWxsZpm4thxEojwsKJ0Eqn9TdnF1G3Kigv0zNNlo7HHz17GSXo3BTHc877V37dlRcnU
 g2K6pHj4YsYGzzPn1MVfJmMDUrH6p4sKD30bC/XhPX41O5CEKyqa8jrVbGwb1thYClK/
 U24hfn/QlhSZGYwkuUyTMBHI8dfIclL4FrW+b3Rh39r5HYTbSmFhmBYK9qOaGytuyu9X
 VB8iRS0/TenxLsIn1gQj1y6VxjejRzgA4xUGEuzDRNg6knd+NtTy4nIdO71gd2kXfgGO
 pZy9ca4Kxd8MAfskWEn4QImFVCTRqqxGWrrHYwMES83YW9baXvt1DUdrvPFMgyXhVIeE fw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
 by mx07-00178001.pphosted.com with ESMTP id 2xakuqn095-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 10:22:53 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5D81F100039;
 Tue,  7 Jan 2020 10:22:47 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag5node3.st.com [10.75.127.15])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E63122A790F;
 Tue,  7 Jan 2020 10:22:46 +0100 (CET)
Received: from lshz10676 (10.75.127.45) by SFHDAG5NODE3.st.com (10.75.127.15)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 7 Jan 2020 10:22:41 +0100
Message-ID: <dc9a1a6a32b0e028837a315834c4723ed44dbac5.camel@st.com>
From: Antonio Borneo <antonio.borneo@st.com>
To: Steven Rostedt <rostedt@goodmis.org>, Joel Fernandes
 <joel@joelfernandes.org>
Date: Tue, 7 Jan 2020 10:21:55 +0100
In-Reply-To: <20191223151301.20be63f7@gandalf.local.home>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204092115.30ef75c9@gandalf.local.home>
 <20191221234741.GA116648@google.com>
 <20191223151301.20be63f7@gandalf.local.home>
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG5NODE3.st.com (10.75.127.15) To SFHDAG5NODE3.st.com
 (10.75.127.15)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_02:2020-01-06,2020-01-07 signatures=0
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [Linux-stm32] [PATCH] tracing: Fix printing ptrs in preempt/irq
 enable/disable events
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

On Mon, 2019-12-23 at 15:13 -0500, Steven Rostedt wrote:
> On Sat, 21 Dec 2019 18:47:41 -0500
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > On Wed, Dec 04, 2019 at 09:21:15AM -0500, Steven Rostedt wrote:
> > > Joel,
> > > 
> > > Any comments on this patch?  
> > 
> > Steve, it looks like this issue happens with trace-cmd not knowing what
> > _stext is. If I do cat trace_pipe , then I don't see the issue as _stext is
> > looked up correctly but the reporter of the bug is using trace-cmd. Is there
> > a way to solve this within trace-cmd? Not knowing much about trace-cmd
> > internals, I will have to defer to you on this though..
> > 
> > Other than this, I need to make the offset to _stext as s32 instead of u32
> > type so that the problem of the symbol location being before _stext does not
> > cause overflow.
> > 
> > Lastly, I am not super convinced that we need to store the full pointer just
> > to handle a case where the offset of the symbol might be more than +-2G from
> > _stext. Once we see such issue, then we can handle it. But right now the size
> > of the trace buffer is utilized better by just storing the offset IMHO.
> > 
> 
> Does this fix it for you?
> 
> -- Steve
> 

Steve,

this patch fixes the issue for me, thanks!
Tested-by: Antonio Borneo <antonio.borneo@st.com>

There are other cases where the trace buffer is under stress, e.g. during function tracing.
Would it be useful to only store the offset in such cases too?

Regards,
Antonio


_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
