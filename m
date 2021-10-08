Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 3103D4262CC
	for <lists+linux-stm32@lfdr.de>; Fri,  8 Oct 2021 05:17:56 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id C2B0AC597B3;
	Fri,  8 Oct 2021 03:17:55 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 80699C57182
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  8 Oct 2021 03:17:53 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id w11so5209426plz.13
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 07 Oct 2021 20:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=ApOKKBCMuAZ4Vx/5ob40RCelwZhTvT67bmG3ANEluW8=;
 b=Qfr5WIt0rkHg4KG3t1iY6J1y1yLDEgcbPf5SHUv1rIzqRBsz/5uzLcJUMZnSn74YL8
 kRDVeCfxp8GigTyNHwoZ0dXS73QmhUds18a8OLJcmshBKJVJLe6dPwCPtGt1Pm425Lvf
 Nl38h/rnebJWGEFPAjPhXZI4C6082a0v7n/5at9C7DIMPq1KY7RgPmh+MyINTBQEz9Kf
 fAdfYxw9vzfPkZCGrmScZLnFVBB/toVTa6tTKyv9z6ZL86/N4zNYHsk9+3+DLh3TPZFp
 pS/H/KM1lSxf7yVQzufzSNFL0cS7lg0i6H4kVt4nnJT8F1ACV5tpppKEn6vYpgoPTEYk
 mJVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version;
 bh=ApOKKBCMuAZ4Vx/5ob40RCelwZhTvT67bmG3ANEluW8=;
 b=nyWJIMK7hAVjEuluscqUiJfplbJ8nKDMi4I3SSWfTrVZE6AOcx+5IjVzJvsFvcqaOh
 y4xMr8gIOsZdJyBSf1f12iOSSWT4bKYxtaniJlmbSDJ3jXiy1pvjVTde/Rx6ddlNyJ/3
 JpPdKsA1woLO9sK4S3UGVfVpUlDESP+a13zl/34ogTl8y2/VOduJa54ACg+PNiYUo+3L
 Bt/rzs3ixyehIZRAxsKFwqiUy18KFniqLwqAv91xh8fFSt3e7yk1dGRL3ph3ycuMCIxm
 A0N+T1DJormEfZVoCS10YwITzWkixFiA5kWbcAM4UrTblE/W6eKxNFkulKBiKRSVj5Mb
 yqfA==
X-Gm-Message-State: AOAM530QFrQiJmcYJBVUui0CIybGM117B7sM4a9QVvzev/DvnT+mHIFD
 KmMJ4fB8AhcS6kZI9nOkVZw=
X-Google-Smtp-Source: ABdhPJyZsmxJ9hP5Kw+9bGwzN9Glcf1vHwpjV6UZVC8OiQmND7+AHtV3qdpWmvagZ5sP1eBuwNI/TQ==
X-Received: by 2002:a17:902:a710:b029:12b:9b9f:c461 with SMTP id
 w16-20020a170902a710b029012b9b9fc461mr7406835plq.59.1633663071904; 
 Thu, 07 Oct 2021 20:17:51 -0700 (PDT)
Received: from localhost (122x211x248x161.ap122.ftth.ucom.ne.jp.
 [122.211.248.161])
 by smtp.gmail.com with ESMTPSA id w185sm737585pfd.113.2021.10.07.20.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 20:17:51 -0700 (PDT)
From: Punit Agrawal <punitagrawal@gmail.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
References: <8e33c244-b786-18e8-79bc-407e27e4756b@arm.com>
Date: Fri, 08 Oct 2021 12:17:48 +0900
In-Reply-To: <8e33c244-b786-18e8-79bc-407e27e4756b@arm.com> (Alexandru
 Elisei's message of "Tue, 28 Sep 2021 10:25:59 +0100")
Message-ID: <87zgrk19yb.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 p.zabel@pengutronix.de, netdev@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 alexandre.torgue@foss.st.com, lgirdwood@gmail.com, joabreu@synopsys.com,
 michael.riesch@wolfvision.net, mcoquelin.stm32@gmail.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 arm-mail-list <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [BUG] Ethernet broken on rockpro64 by commit
 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced pm_runtime_enable
 warnings")
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

Alexandru Elisei <alexandru.elisei@arm.com> writes:

> (Sorry I'm sending this to the wrong person, this is what I got
> scripts/get_maintainer.pl for the file touched by the commit)
>
> After commit 2d26f6e39afb ("net: stmmac: dwmac-rk: fix unbalanced
> pm_runtime_enable warnings"), the network card on my rockpro64-v2 was left unable
> to get a DHCP lease from the network. The offending commit was found by bisecting
> the kernel; I tried reverting the commit from current master (commit 0513e464f900
> ("Merge tag 'perf-tools-fixes-for-v5.15-2021-09-27' of
> git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux")) and the network card
> was working as expected.
>
> It goes without saying that I can help with testing the fix and
> further diagnosing.

A fix was recently merged for this (see aec3f415f724 ("net: stmmac:
dwmac-rk: Fix ethernet on rk3399 based devices") and should show up in
the next rc. Please shout out if that doesn't fix the broken ethernet
for you.

Thanks,
Punit

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
