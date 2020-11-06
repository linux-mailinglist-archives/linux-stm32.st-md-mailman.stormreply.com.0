Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id E16BB2A9965
	for <lists+linux-stm32@lfdr.de>; Fri,  6 Nov 2020 17:23:52 +0100 (CET)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F999C3FAD4;
	Fri,  6 Nov 2020 16:23:52 +0000 (UTC)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 465BAC36B0B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  6 Nov 2020 16:23:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4CSQgS2Jttz1qsb3;
 Fri,  6 Nov 2020 17:23:48 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4CSQgS1CkCz1qqkp;
 Fri,  6 Nov 2020 17:23:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 2SL-2vbKaimu; Fri,  6 Nov 2020 17:23:46 +0100 (CET)
X-Auth-Info: S/hgMWz1M4XPXjC6yyBDoTpIhpuX5FSYTqbGWsx+7mo=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri,  6 Nov 2020 17:23:46 +0100 (CET)
To: Yannick FERTRE <yannick.fertre@st.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20201104125200.259639-1-marex@denx.de>
 <20201105093945.GS401619@phenom.ffwll.local>
 <e7bdd094-2109-34f1-77dc-165ff2706d20@denx.de>
 <66c438ec-42f6-0c1d-0eee-ee5501996668@st.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <480e5923-9b5b-1684-93cc-65d912dd08b9@denx.de>
Date: Fri, 6 Nov 2020 17:23:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <66c438ec-42f6-0c1d-0eee-ee5501996668@st.com>
Content-Language: en-US
Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
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

On 11/6/20 5:13 PM, Yannick FERTRE wrote:
> Hi Marek,

Hi,

> On 11/5/20 10:45 AM, Marek Vasut wrote:
>> On 11/5/20 10:39 AM, Daniel Vetter wrote:
>>> On Wed, Nov 04, 2020 at 01:52:00PM +0100, Marek Vasut wrote:
>>>> Enable runtime PM before registering the fbdev emulation and disable it
>>>> afterward, otherwise register access to the LTDC IP during the fbdev
>>>> emulation registration might hang the system.
>>>>
>>>> The problem happens because RPM is activated at the end of ltdc_load(),
>>>> but the fbdev emulation registration happens only after that, and ends
>>>> up calling ltdc_crtc_mode_set_nofb(), which checks whether RPM is active
>>>> and only if it is not active, calls pm_runtime_get_sync() to enable the
>>>> clock and so on. If the clock are not enabled, any register access in
>>>> ltdc_crtc_mode_set_nofb() could hang the platform completely.
>>>>
>>>> This patch makes sure that ltdc_crtc_mode_set_nofb() is called within
>>>> pm_runtime_get_sync(), so with clock enabled.
>>
>> [...]
>>
>>> This looks like you're papering over a bug in your modeset code. If
>>> userspace later on does a setpar on the fbdev chardev, the exact same
>>> thing could happen. You need to fix your modeset code to avoid this, not
>>> sprinkle temporary rpm_get/put all over some top level entry points,
>>> because you can't even patch those all.
>>
>> I have a feeling all those pm_runtime_active() checks in the driver
>> might be the root cause of this ? I wonder why the code doesn't use
>> pm_runtime_{get,put}_sync() only when accessing registers. Thoughts?
> 
> First line of function ltdc_crtc_mode_set_nofb check the pm_runtime to
> avoid to access registers without clock enabled.
> 
> 
> 
> static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
> {
> ...
> 	if (!pm_runtime_active(ddev->dev)) {
> 		ret = pm_runtime_get_sync(ddev->dev);
> 
> I test the fb with framebuffer console, & it works fine on my side.
> Do you test fb on a old kernel?
> How can I reproduce your issue?

I observed sporadic hangs and tracked it down to the fbdev registration, 
which calls this code. Note that pm_runtime_active() here will return 0, 
because it was already activated in ltdc_load().

My question in reply to Daniel was more geared toward why do we even 
have all these checks in the driver, wouldn't it be better to just 
always call pm_runtime_get_sync()/pm_runtime_put_sync() in the code 
which requires the hardware to be active ?
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
