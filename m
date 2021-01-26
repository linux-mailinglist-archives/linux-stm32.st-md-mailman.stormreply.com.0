Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D947303702
	for <lists+linux-stm32@lfdr.de>; Tue, 26 Jan 2021 08:04:33 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C30BBC57180;
	Tue, 26 Jan 2021 07:04:32 +0000 (UTC)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
 [209.85.166.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 2E7B3C3FADA
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 26 Jan 2021 02:49:56 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id e22so30897030iog.6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 25 Jan 2021 18:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y2OMCYury8maPiWxpt+7CFHDCbLbUypfXTudWpQDpr0=;
 b=ckPLG/urYBLo55XHt4hmNuPlsjVgkcuI9XxWAx3xfGd2xHBPTDukj7Xx9HAuDgvheb
 MLIaiA5VfoIJgdZ2SDssJmJgEA7G1Y9XxHoaiJpiSO+l1Cl6fh6tAT9rJVx5LrP1MDmN
 LkLD4hYLyIAjquocsZ0F2YOBgSwLlrke2RlsFNscEAnXC3vNoUTWnIyArgEANcHO1yiF
 WDOgah/JDcMUgO2YhQBgscv9NiJJ5kHsAFMxlIhvJieT+nOwPR8jBInItWOwFY12N58z
 LqvGLboJl5hR5pPvWp2jVILk/60gDups4I6bsbiiDQzEIH4/kutDTJF6JgJfAv0W8Xbf
 v+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y2OMCYury8maPiWxpt+7CFHDCbLbUypfXTudWpQDpr0=;
 b=kkXqcjnyo5PhoxbLnrro5ba4JlbC4shGyEAOnT0arwXDbUh9sEG5BPPG3vCh3pxDF0
 aQMMXlW9CTYoo0g1vknxFeKiObek0rqJlGARW3cs5Rpqi5KbdaMRUuXn1zbc2jBjYR4D
 HVN83VhAenSklNTpraQAxue3c8pf8maIbVAF92n3RrxRdDllcTWy1F1u+dk+2s2NUTz8
 YOiPQFK/3IUCxMgU38Kb+AychYOObCvmifLUXqPInBT5c40de2YfRfvWLXI43ve6D9Or
 awjxDASKyHWhAjH95g7+TXNbz7Ss7uBBx6cncFIrpTPGaUhtGhvQaof/84zVQvfWgp3J
 mLxQ==
X-Gm-Message-State: AOAM53210inpaBothgmdr9nK8oQMNPnPi0P2Y5M6IW1Kr0Pjb+P5CUD9
 ZXMyrwUrR1iYOfVqhK0tEOIS4rlPa8emT1VG0C7+/hPC
X-Google-Smtp-Source: ABdhPJxNp8CcbgR7HXWgSIA71g464Xdz/T9/isOHwLG6XL8m+f5wMwqHVLrHwIUdZQne096ZEBuQnUyCNseFisJFLyw=
X-Received: by 2002:a92:8e4b:: with SMTP id k11mr2842701ilh.192.1611629394718; 
 Mon, 25 Jan 2021 18:49:54 -0800 (PST)
MIME-Version: 1.0
From: Dave Flogeras <dflogeras2@gmail.com>
Date: Mon, 25 Jan 2021 22:49:43 -0400
Message-ID: <CANB0TnTx2RfWpmxR2BTQrytrxeJuZiB9kmv-ZHZiX6skPTVwEQ@mail.gmail.com>
To: linux-stm32@st-md-mailman.stormreply.com
X-Mailman-Approved-At: Tue, 26 Jan 2021 07:04:28 +0000
Subject: [Linux-stm32] STM32F769 discovery, ethernet and/or VFP
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
Content-Type: multipart/mixed; boundary="===============1716624475590714112=="
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

--===============1716624475590714112==
Content-Type: multipart/alternative; boundary="00000000000094f30605b9c4b5d8"

--00000000000094f30605b9c4b5d8
Content-Type: text/plain; charset="UTF-8"

Hi list,

I've recently started hacking Linux on my STM32F769 disc1 board.  Just
interested in what is/isn't working, and what I can get working on this
board.

So far I've built u-boot, the 5.4.x kernel, and a buildroot userspace.
After a few stumbles, I'm able to bootstrap the board, load the kernel and
run a basic shell.  Next I'd like to get the ethernet peripheral up and
running.  I notice that while u-boot supports ethernet on this board, the
kernel's dts files don't seem to include anything ethernet related
(compared with the F4 dts files).  When I built the DWMAC_STM32 driver, no
device seems to appear after booting.

Is this a feasible idea to get going?  Is it just something I'm missing, or
not currently implemented at all?


The other major thing I'd like to enable is floating point support.  It
seems the mainline kernel only supports VFP on armv7.  The old emcraft
kernel seems to have had some patches relating to float on armv7m.  What is
the current state of this?  A pipe-dream?

Thanks for any pointers,
Dave

--00000000000094f30605b9c4b5d8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi list,<div><br></div><div>I&#39;ve recently started hack=
ing Linux on my STM32F769 disc1 board.=C2=A0 Just interested in what is/isn=
&#39;t working, and what I can get working on this board.</div><div><br></d=
iv><div>So far I&#39;ve built u-boot, the 5.4.x kernel, and a buildroot use=
rspace.=C2=A0 After a few stumbles, I&#39;m able to bootstrap the board, lo=
ad the kernel and run a basic shell.=C2=A0 Next I&#39;d like to get the eth=
ernet peripheral up and running.=C2=A0 I notice that while u-boot supports =
ethernet on this board, the kernel&#39;s dts files don&#39;t seem to includ=
e anything ethernet related (compared with the F4 dts files).=C2=A0 When I =
built the DWMAC_STM32 driver, no device seems to appear after booting.</div=
><div><br></div><div>Is this a feasible idea to get going?=C2=A0 Is it just=
 something I&#39;m missing, or not currently implemented at all?</div><div>=
<br></div><div><br></div><div>The other major thing I&#39;d like to enable =
is floating point support.=C2=A0 It seems the mainline kernel only supports=
 VFP on armv7.=C2=A0 The old emcraft kernel seems to have had some patches =
relating to float on armv7m.=C2=A0 What is the current state of this?=C2=A0=
 A pipe-dream?</div><div><br></div><div>Thanks for any pointers,</div><div>=
Dave</div></div>

--00000000000094f30605b9c4b5d8--

--===============1716624475590714112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32

--===============1716624475590714112==--
