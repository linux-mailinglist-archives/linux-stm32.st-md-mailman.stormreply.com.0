Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6D52A7AE6
	for <lists+linux-stm32@lfdr.de>; Thu,  5 Nov 2020 10:45:10 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E18FC3FAD4;
	Thu,  5 Nov 2020 09:45:10 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3FA6CC36B35
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu,  5 Nov 2020 09:45:09 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CRdsw1Q1Zz1rwDp;
 Thu,  5 Nov 2020 10:45:08 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CRdsw0TMgz1qrfs;
 Thu,  5 Nov 2020 10:45:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id SOK1wU8IuNZ2; Thu,  5 Nov 2020 10:45:06 +0100 (CET)
X-Auth-Info: dZUxt/XeKAi3SvXTXM+BYnQnzwS+lbbpLTOi5g18l38=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Thu,  5 Nov 2020 10:45:06 +0100 (CET)
To: Daniel Vetter <daniel@ffwll.ch>
References: <20201104125200.259639-1-marex@denx.de>
 <20201105093945.GS401619@phenom.ffwll.local>
From: Marek Vasut <marex@denx.de>
Message-ID: <e7bdd094-2109-34f1-77dc-165ff2706d20@denx.de>
Date: Thu, 5 Nov 2020 10:45:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105093945.GS401619@phenom.ffwll.local>
Content-Language: en-US
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Yannick_Fertr=c3=a9?= <yannick.fertre@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: Re: [Linux-stm32] [PATCH] drm/stm: Enable RPM during fbdev
	registration
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

On 11/5/20 10:39 AM, Daniel Vetter wrote:
> On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
>> Enable runtime PM before registering the fbdev emulation and disable it
>> afterward, otherwise register access to the LTDC IP during the fbdev
>> emulation registration might hang the system.
>>
>> The problem happens because RPM is activated at the end of ltdc_load(),
>> but the fbdev emulation registration happens only after that, and ends
>> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
>> and only if it is not active, calls pm_runtime_get_sync() to enable the
>> clock and so on. If the clock are not enabled, any register access in
>> ltdc_crtc_mode_set_nofb() could hang the platform completely.
>>
>> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
>> pm_runtime_get_sync(), so with clock enabled.

[...]

> This looks like you're papering over a bug in your modeset code. If
> userspace later on does a setpar on the fbdev chardev, the exact same
> thing could happen. You need to fix your modeset code to avoid this, not
> sprinkle temporary rpm_get/put all over some top level entry points,
> because you can't even patch those all.

I have a feeling all those pm_runtime_active() checks in the driver 
might be the root cause of this ? I wonder why the code doesn't use 
pm_runtime_{get,put}_sync() only when accessing registers. Thoughts?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
