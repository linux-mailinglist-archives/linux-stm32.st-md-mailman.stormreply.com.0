Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A4373B28
	for <lists+linux-stm32@lfdr.de>; Wed,  5 May 2021 14:26:54 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2DE53C5718F;
	Wed,  5 May 2021 12:26:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 02691C3FADC
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  5 May 2021 12:26:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 72BE1613B3;
 Wed,  5 May 2021 12:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620217611;
 bh=YL7D4o7kDUatxUlkVQK7lpg7yBylqK7Icu1EuQsksM0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=iToY3lL0hRaSsi7NkW1PYxuRNLCT7cc9E8r8AdVH574Z2d9DDm/+k5C8uRQVjvdKD
 h6on9jJRLx0yhiBkQNF07zjvs6V5gO8h9mH7nZaW7KDhtya7E+H5RMUw5IP7mgmA5B
 1rfukrRHUXnR/q9gPkzE6x9noxe7Z6DAweMllFeNNCWO7fulRAj9PoFFAsh1pAYWvb
 juytEMSxgmmrNvfvmhKNeJoURWOP9MnXK3fFodPmIr6e+0gkpkTdzmS5XsmeSRcQNS
 WHQKPXLspNLiD2P6HerPqs6eFn44SmCqgO9Ecmc4+5BxX89B3oroKtjheUWJC4eLPx
 sv4+C49pNwbxQ==
Date: Wed, 5 May 2021 14:26:47 +0200 (CEST)
From: Jiri Kosina <jikos@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
In-Reply-To: <20210402094041.3424285-1-weiyongjun1@huawei.com>
Message-ID: <nycvar.YFH.7.76.2105051426390.28378@cbobk.fhfr.pm>
References: <20210402094041.3424285-1-weiyongjun1@huawei.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Cc: Dario Pagani <dario.pagani.146@gmail.com>, kernel-janitors@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Hulk Robot <hulkci@huawei.com>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-input@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH -next] HID: thrustmaster: fix return value
 check in thrustmaster_probe()
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

On Fri, 2 Apr 2021, Wei Yongjun wrote:

> Fix the return value check which testing the wrong variable
> in thrustmaster_probe().
> 
> Fixes: c49c33637802 ("HID: support for initialization of some Thrustmaster wheels")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/hid/hid-thrustmaster.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-thrustmaster.c b/drivers/hid/hid-thrustmaster.c
> index bfcd08759ba0..fada3536f60e 100644
> --- a/drivers/hid/hid-thrustmaster.c
> +++ b/drivers/hid/hid-thrustmaster.c
> @@ -311,7 +311,7 @@ static int thrustmaster_probe(struct hid_device *hdev, const struct hid_device_i
>  	}
>  
>  	tm_wheel->change_request = kzalloc(sizeof(struct usb_ctrlrequest), GFP_KERNEL);
> -	if (!tm_wheel->model_request) {
> +	if (!tm_wheel->change_request) {
>  		ret = -ENOMEM;

Good catch, applied. Thanks,

-- 
Jiri Kosina
SUSE Labs

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
