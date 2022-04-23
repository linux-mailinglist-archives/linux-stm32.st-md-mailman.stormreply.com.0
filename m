Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A1150E61A
	for <lists+linux-stm32@lfdr.de>; Mon, 25 Apr 2022 18:45:10 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5DEABC62D42;
	Mon, 25 Apr 2022 16:45:10 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 72874C60492
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat, 23 Apr 2022 07:11:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2999560B01;
 Sat, 23 Apr 2022 07:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED7FC385A5;
 Sat, 23 Apr 2022 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650697904;
 bh=54N2y6k5E9toeQNKry6B5Iwwayov2BxK7D3aXm5bbQU=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=Br8SGKDcW1H7h5lQKauNpfzbm6kskdo2xyY670ndgkt1WicxmA8SU1OAXGaDyNiGx
 trA57x7prYZIaIKQpduj/0EXgHuHZ8Ow75aXd2jAw9BJ6eP6eYayAaMrmiDGZbaOQT
 IuaRm3p0M6FtSyYsoHAkB4KNrod4bYjmjzJfL6cInmdXk8bBV0ojKZsNDsYe3LosH0
 HrABjObZbf4PffSO4Cwycvzy46+ezMRw0xMhJ0XfxfqWCGOjb/elFkwkpE8Ah38fNF
 EnRc4Sq93x5zvz8e99LPdcaSVNDD7rgUylhydySD0u/9aI17fZFVaFnSOSnXj9x3GU
 fRkt4Z+SFjPOg==
MIME-Version: 1.0
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220413093502.2538316-1-chi.minghao@zte.com.cn>
References: <20220413093502.2538316-1-chi.minghao@zte.com.cn>
To: cgel.zte@gmail.com
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165069790028.11296.14239261919383930715.kvalo@kernel.org>
Date: Sat, 23 Apr 2022 07:11:42 +0000 (UTC)
X-Mailman-Approved-At: Mon, 25 Apr 2022 16:45:09 +0000
Cc: netdev@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, davem@davemloft.net, kuba@kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] wlcore: testmode: use
 pm_runtime_resume_and_get() instead of pm_runtime_get_sync()
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

cgel.zte@gmail.com wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>

Patch applied to wireless-next.git, thanks.

3447eebe6084 wlcore: testmode: use pm_runtime_resume_and_get() instead of pm_runtime_get_sync()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220413093502.2538316-1-chi.minghao@zte.com.cn/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
