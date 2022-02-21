Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 042184BD76E
	for <lists+linux-stm32@lfdr.de>; Mon, 21 Feb 2022 09:14:52 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B173DC6046B;
	Mon, 21 Feb 2022 08:14:52 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 64AEFC60461
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 21 Feb 2022 08:14:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E27DBB80E8A;
 Mon, 21 Feb 2022 08:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD281C340E9;
 Mon, 21 Feb 2022 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645431289;
 bh=boZhPSB1xtCOEB/B6XCck3Jo6oe1RHC8RkPDFQS7pFQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TSlz0KJCs+LdQvPlsuuDJ4YEHMrf4VEt2dUmxXP3tHPmn3kll7WaZMDG25dVRELm5
 7O9iSoLgTrjO5xM51JRzJIR/wYhGu4icHJhGFqHWW0mokW10ltghbaktaNYgtNW/HX
 UGY1N1qihUl9Zx6oxBHMU9GoaVrthtDF9swg1i1birLclgS95v9qUD2Yuzc8L9ex+I
 O+DnvkVHYjxZGucVY+Qer3y3fvMEs3iSBoOqT+Q1PjLQcjapGPNhHa4yCEiJyMsXvo
 qco+CoVpRu9PdaeH+EdYo5sSiv3Aa2+Ma55R5MPYkBWz9XPpxpGHMdZDvFT0QuBdma
 kYpxwtaj+6Y6w==
Date: Mon, 21 Feb 2022 09:14:45 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <43992c7a-c8e7-29a6-d0f0-f69abccd62a1@gmail.com>
Message-ID: <nycvar.YFH.7.76.2202210914220.11721@cbobk.fhfr.pm>
References: <000000000000d181a205d874c066@google.com>
 <cd08c05f-f648-071f-d8f5-0a022cd35b7b@gmail.com>
 <nycvar.YFH.7.76.2202210900420.11721@cbobk.fhfr.pm>
 <43992c7a-c8e7-29a6-d0f0-f69abccd62a1@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: syzbot <syzbot+35eebd505e97d315d01c@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 alexandre.torgue@foss.st.com, benjamin.tissoires@redhat.com,
 mcoquelin.stm32@gmail.com, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [syzbot] KASAN: slab-out-of-bounds Read in
	thrustmaster_probe
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

On Mon, 21 Feb 2022, Pavel Skripkin wrote:

> >> Looks like missing check for malicious device. Need to check number of
> >> endpoints before accessing endpoints array
> >> 
> >> 
> >> #syz test
> >> git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > 
> > Thanks Pavel. Could you please send the patch with proper changelog and
> > SOB my way?
> > 
> 
> I've already posted the patch :) You can find it here [1] (you are in CC of
> course)
> 
> 
> [1] https://lore.kernel.org/all/20220220160114.26882-1-paskripkin@gmail.com/

Hmm, for some reason I don't see it in my inbox, but I'll grab it from the 
ML and apply.

Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
