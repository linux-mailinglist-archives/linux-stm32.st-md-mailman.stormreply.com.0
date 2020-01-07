Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD41328BC
	for <lists+linux-stm32@lfdr.de>; Tue,  7 Jan 2020 15:22:37 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id BFD24C36B0B;
	Tue,  7 Jan 2020 14:22:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2163FC36B09
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2020 14:22:33 +0000 (UTC)
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D293D20715;
 Tue,  7 Jan 2020 14:22:31 +0000 (UTC)
Date: Tue, 7 Jan 2020 09:22:30 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Antonio Borneo <antonio.borneo@st.com>
Message-ID: <20200107092230.473d7fc1@gandalf.local.home>
In-Reply-To: <dc9a1a6a32b0e028837a315834c4723ed44dbac5.camel@st.com>
References: <20191127154428.191095-1-antonio.borneo@st.com>
 <20191204092115.30ef75c9@gandalf.local.home>
 <20191221234741.GA116648@google.com>
 <20191223151301.20be63f7@gandalf.local.home>
 <dc9a1a6a32b0e028837a315834c4723ed44dbac5.camel@st.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Joel Fernandes <joel@joelfernandes.org>, Ingo Molnar <mingo@redhat.com>,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
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

On Tue, 7 Jan 2020 10:21:55 +0100
Antonio Borneo <antonio.borneo@st.com> wrote:

> There are other cases where the trace buffer is under stress, e.g. during function tracing.
> Would it be useful to only store the offset in such cases too?

It could be possible but may require another event type and an option,
as it may break existing tooling.

-- Steve

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
