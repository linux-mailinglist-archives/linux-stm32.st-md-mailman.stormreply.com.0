Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id D80293DD354
	for <lists+linux-stm32@lfdr.de>; Mon,  2 Aug 2021 11:51:15 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 83526C5A4E7;
	Mon,  2 Aug 2021 09:51:15 +0000 (UTC)
Received: from birdy.pmhahn.de (birdy.pmhahn.de [88.198.22.186])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 322B4C57B5A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 13 Jul 2021 06:02:28 +0000 (UTC)
Received: from [IPv6:2003:e2:7738:c200:a5ae:ca72:d4d5:6724]
 (p200300E27738C200A5aEcA72d4D56724.dip0.t-ipconnect.de
 [IPv6:2003:e2:7738:c200:a5ae:ca72:d4d5:6724])
 by birdy.pmhahn.de (Postfix) with ESMTPSA id 626F62208EDA;
 Tue, 13 Jul 2021 08:02:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pmhahn.de; s=202002;
 t=1626156148; bh=HfuvmijpRKAZ3kq4/6lrXulnT7YaLAQipZHwr6kr8E4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LYIB3WsIHggROpun740ag9e7XbypxixZ7+A8tFMhcdDqX/BKG9jLUjKLpu4NFLMvq
 0tXGrnAMg2+aZO+6LulZj++mey3V94gkXReys0qXDjGag3e6HWTeYeGsiiba7VdldA
 g/jVYlxxKDB1N5mW512dO9HEe3FuPoERGdbfANO7vezjSLvBUWPnMD4LGDpPhOl/PW
 f+glKg7wSMqU4oucsqYG4AX0UTn7h4OwQBsWXjbMRQ1cL4nnfd1N377WGdmz5MzMfl
 ux5aZ71QWZJaLJbn6Zz7UMdsU8T1HXLDlkVmb30TTAwrjp54J2j65B5D5oHMGQRiPp
 57OhLqZcJW56w==
To: Salah Triki <salah.triki@gmail.com>, fabrice.gasnier@foss.st.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com
References: <20210712231910.GA1831270@pc>
From: Philipp Hahn <pmhahn@pmhahn.de>
Message-ID: <e597d6b8-55d6-2fa6-5f79-86ff813d8bd2@pmhahn.de>
Date: Tue, 13 Jul 2021 08:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210712231910.GA1831270@pc>
Content-Language: de-DE
X-Mailman-Approved-At: Mon, 02 Aug 2021 09:51:10 +0000
Cc: linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [Linux-stm32] [PATCH] divide by 3*sizeof(u32) when computing
	array_size
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-stm32-bounces@st-md-mailman.stormreply.com
Sender: "Linux-stm32" <linux-stm32-bounces@st-md-mailman.stormreply.com>

Hello,

Disclaimer: I have no idea what 'pwm-stm32' is or does

Am 13.07.21 um 01:19 schrieb Salah Triki:
> Divide by 3*sizeof(u32) when computing array_size, since stm32_breakinput
> has 3 fields of type u32.
...
> --- a/drivers/pwm/pwm-stm32.c
> +++ b/drivers/pwm/pwm-stm32.c
> @@ -544,7 +544,7 @@ static int stm32_pwm_probe_breakinputs(struct stm32_pwm *priv,
>   		return -EINVAL;
>   
>   	priv->num_breakinputs = nb;
> -	array_size = nb * sizeof(struct stm32_breakinput) / sizeof(u32);
> +	array_size = nb * sizeof(struct stm32_breakinput) / (3 * sizeof(u32));

Maybe it's too early in the morning for me, but this does not look right:

> struct stm32_breakinput {
> 	u32 index;
> 	u32 level;
> 	u32 filter;
> };

then "sizeof(struct stm32_breakinput)" == "(3 * sizeof(u32))", which 
would simply make "arrray_site := nb" ?

Philipp
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
