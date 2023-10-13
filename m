Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3D7C87FA
	for <lists+linux-stm32@lfdr.de>; Fri, 13 Oct 2023 16:40:18 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 7B092C6B442;
	Fri, 13 Oct 2023 14:40:18 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id EF9B7C6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 14:40:17 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B6F8A3F69A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 14:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1697208016;
 bh=4Q8qjtTOqM69UGB+qq5ucuXcWb20VRz1rn7B8+UgamA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=AHTFyC4Dy4Hm9lUhRO/+0ht1VWNm5xzeCPc+jMQXRDMt+VS7K8RLkypgv/jy3S5Hl
 XBKZTgX3/V52lG0iwS+Hi06RSeYaGWoYeLnP/cJJQVaIQWxxs1OmDc/+nMjMYbbwnV
 l9cRrO7GeqcMscG8vkHWZysmB25zeSVlVdgrIZvRxcI1STHho80jC67QI1+omZDvPS
 sMPhZyRAeNqNA3iCLKKk0Ak02B0pt2K3d5URYG4MMAVcIJ4ZaH18g4qPuSzD1zo3WG
 v6cGyxsQ4QIosoq3iivcGDTLVaJux3GK4gG4CQ4h+lSgWjexB3f5ygo3JISu/IWX0X
 ZWTbQFXYkW+IQ==
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-313c930ee0eso1250033f8f.0
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 13 Oct 2023 07:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697208016; x=1697812816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Q8qjtTOqM69UGB+qq5ucuXcWb20VRz1rn7B8+UgamA=;
 b=kzLtAgPYxNH87of0a+YG+D9v/PDuWbk+FJ3Rn7teM0KIeQTFMVd8LuoNXraFmg4OJ5
 ISepDkVyhzTFlIUwMBatgKIFbRzY1Kf4A2noEALsPekSmL8papcHCCqCLpHJTYujyitr
 2UnMaorL4qTVBmWzHtsaOwJeDV6H8RCLPXaiej3w/sSGy2YhOhMFrHLqiokvgne97oqV
 XShf7j/n8UOkB1b0BKJydISsh3WHfZgU6ddEwOARJatBA6mVTyg6iCZHEUi3ht2yeRjb
 iljeMDfTDFCJRpSeu0yvlovnMW17sk4DzHWbTKkTW1cjK3UBNOHakHMsyOl3QObTpVcB
 iXJQ==
X-Gm-Message-State: AOJu0Yxya3yiEOrAtXy9xXikeDLeiJwXwtakfhXM2xnxdItU5ZUuHQY1
 1Jsag13OFfMos0c7jBocc9iSfRnjdFn1iFvxWuzSG7tEyddL/t2gpU+NUJx5V0oBk9Ke4QqbtFd
 QHLNa7Rh0R69HojmYydSpNpCVw9bx0BRYloxBnzpW40ocxDHbfwsn2xqAU1oXYAxcvDo4jXorNg
 ==
X-Received: by 2002:adf:b613:0:b0:32d:9876:571c with SMTP id
 f19-20020adfb613000000b0032d9876571cmr2165034wre.63.1697208016285; 
 Fri, 13 Oct 2023 07:40:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNMtvOMfvtHRsCfuYjDaRp2+xKVftk4EeEH80Pl99DSkhNsK0NT6vWxwfIWZRNNCDwt+rGXII5LrykndHgnuQ=
X-Received: by 2002:adf:b613:0:b0:32d:9876:571c with SMTP id
 f19-20020adfb613000000b0032d9876571cmr2165019wre.63.1697208016003; Fri, 13
 Oct 2023 07:40:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231008040140.1647892-1-dimitri.ledkov@canonical.com>
 <ZSkeWHdOAOfjtpwJ@gondor.apana.org.au>
 <2e52c8b4-e70a-453f-853a-1962c8167dfa@gmail.com>
In-Reply-To: <2e52c8b4-e70a-453f-853a-1962c8167dfa@gmail.com>
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Date: Fri, 13 Oct 2023 15:39:40 +0100
Message-ID: <CADWks+aV+QzJo8LQt9eD4YSghF+Ez7iDx8zzz_hfL_2am2zLNA@mail.gmail.com>
To: Denis Kenzior <denkenz@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Marcel Holtmann <marcel@holtmann.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 James Prestwood <prestwoj@gmail.com>
Subject: Re: [Linux-stm32] [PATCH] crypto: remove md4 driver
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

On Fri, 13 Oct 2023 at 15:37, Denis Kenzior <denkenz@gmail.com> wrote:
>
> Hi Herbert,
>
> On 10/13/23 05:39, Herbert Xu wrote:
> > On Sun, Oct 08, 2023 at 05:01:39AM +0100, Dimitri John Ledkov wrote:
> >> No internal users left and cryptographically insecure. Users should
> >> upgrade to something else, e.g. sha256 blake3.
> >>
> >> Some drivers have their own full or partial md4 implementation without
> >> using crypto/md4.
> >>
> >> Userspace code search indicates a few copies of hash_info.h
> >> https://codesearch.debian.net/search?q=HASH_ALGO_MD4&literal=1 without
> >> need for MD4.
> >>
> >> Preserve uapi hash algorithm indexes and array length, but rename the
> >> MD4 enum.
> >>
> >> Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
> >> ---
> >>   crypto/Kconfig                 |   6 -
> >>   crypto/Makefile                |   1 -
> >>   crypto/hash_info.c             |   4 +-
> >>   crypto/md4.c                   | 241 ---------------------------------
> >>   crypto/tcrypt.c                |  12 --
> >>   crypto/testmgr.c               |   6 -
> >>   crypto/testmgr.h               |  42 ------
> >>   include/uapi/linux/hash_info.h |   2 +-
> >>   8 files changed, 3 insertions(+), 311 deletions(-)
> >>   delete mode 100644 crypto/md4.c
> >
> > Patch applied.  Thanks.
>
> Does this patch break userspace?

I will check all of the below and get back to you.

>
> Here's a thread regarding MD4 the last time its removal was attempted:
> https://lore.kernel.org/linux-crypto/20210818144617.110061-1-ardb@kernel.org/
>
> Please note that iwd does use MD4 hashes here:
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/checksum.c#n63
>
> https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-mschapv2.c#n165
>
> Regards,
> -Denis



-- 
okurrr,

Dimitri
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
