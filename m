Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5843B5F7E
	for <lists+linux-stm32@lfdr.de>; Mon, 28 Jun 2021 15:58:43 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 6E47DC57B53;
	Mon, 28 Jun 2021 13:58:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id ED35BC5662F
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 28 Jun 2021 13:58:40 +0000 (UTC)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id EE13D82C91;
 Mon, 28 Jun 2021 15:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1624888720;
 bh=q242niofhv3JEKuqEe5Nn4X51i2z28KhUnxMQLfI01o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xu5bPXf0mFoIP0U2J0Wp1w87W3LJcAf6UtzsMSV50CSG/NfD3KrpkOe07fCSX5jaU
 pjZVvMI2WB2Jm3FEZVr33UJZV4+NxS/YWuiWbqPGuhB+w7agG06wuTs7+rOX0B9Mf5
 I9jzXHtuidQi3hrqPm4In4uJFVyEFf7WVEzNNTsaBdGR/jkhiUiXPgrGSmtLgjiBNB
 +LmfgRBcwsnjpbuEKXQBGIUAv+bcp/BeeEM66J75ew6Q6O4GrOEauI+1ZfxNHoTn5F
 KRZp97koGv2CSAyaP/k/u89zpwdhXmMuX5Di3vJEPRnBfOIbEVTDVKLJsKT+MYq9IE
 5WNt2a96m7Z9A==
To: Greg KH <gregkh@linuxfoundation.org>
References: <20210408230001.310215-1-marex@denx.de>
 <47597d13-e6ec-ccd2-c34b-eb65896cdd70@denx.de> <YNnAxiDMCQ8Y05ll@kroah.com>
 <7fc37c79-4e04-2cb0-efc4-4f642316c612@denx.de> <YNnIXjGyvaQgf2wP@kroah.com>
 <7137f147-f127-2884-39e7-7cfabe9e2bfc@denx.de> <YNnQ5F43u0hurra3@kroah.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <60e34720-99af-fdaa-0acf-e171298c220d@denx.de>
Date: Mon, 28 Jun 2021 15:58:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNnQ5F43u0hurra3@kroah.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Cc: Sasha Levin <sashal@kernel.org>, Alexandre Torgue <alexandre.torgue@st.com>,
 Patrice Chotard <patrice.chotard@st.com>,
 Patrick Delaunay <patrick.delaunay@st.com>,
 linux-stable <stable@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH] ARM: dts: stm32: Rework LAN8710Ai PHY
	reset on DHCOM SoM
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

On 6/28/21 3:38 PM, Greg KH wrote:
> On Mon, Jun 28, 2021 at 03:10:36PM +0200, Marek Vasut wrote:
>> On 6/28/21 3:02 PM, Greg KH wrote:
>>> On Mon, Jun 28, 2021 at 02:32:50PM +0200, Marek Vasut wrote:
>>>> On 6/28/21 2:29 PM, Greg KH wrote:
>>>>> On Mon, Jun 28, 2021 at 12:44:37PM +0200, Marek Vasut wrote:
>>>>>> On 4/9/21 1:00 AM, Marek Vasut wrote:
>>>>>>> The Microchip LAN8710Ai PHY requires XTAL1/CLKIN external clock to be
>>>>>>> enabled when the nRST is toggled according to datasheet Microchip
>>>>>>> LAN8710A/LAN8710Ai DS00002164B page 35 section 3.8.5.1 Hardware Reset:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> Fixes: 34e0c7847dcf ("ARM: dts: stm32: Add DH Electronics DHCOM STM32MP1 SoM and PDK2 board")
>>>>>>
>>>>>> Adding stable to CC.
>>>>>>
>>>>>> Patch is now part of Linux 5.13 as commit
>>>>>>
>>>>>> 1cebcf9932ab ("ARM: dts: stm32: Rework LAN8710Ai PHY reset on DHCOM SoM")
>>>>>
>>>>> $ git show 1cebcf9932ab
>>>>> fatal: ambiguous argument '1cebcf9932ab': unknown revision or path not in the working tree.
>>>>> Use '--' to separate paths from revisions, like this:
>>>>> 'git <command> [<revision>...] -- [<file>...]'
>>>>>
>>>>> Are you sure?
>>>>
>>>> This would seem to indicate so:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1cebcf9932ab76102e8cfc555879574693ba8956
>>>>
>>>> linux-2.6$ git describe 1cebcf9932ab76102e8cfc555879574693ba8956
>>>> v5.13-rc1-1-g1cebcf9932ab
>>>>
>>>> Did the commit get abbreviated too much ?
>>>
>>> Something is really odd, as that commit _is_ in linux-next, but it is
>>> not in my local copy of Linus's tree.
>>>
>>> So how it is showing up in that link above is beyond me.  Can you see it
>>> locally on your machine?
>>
>> Yes, that's where the git describe came from. And I used a different repo
>> than the one from which I submitted the patch originally, so the commit
>> must've come from fetching origin (i.e. linus tree).
>>
>> Could it be this "ambiguous argument '1cebcf9932ab'" , which would indicate
>> the commit hash got abbreviated too much ?
> 
> The web site "lies" it has a shared backend.  Trust your local copy of
> the tree, that shows that this commit is NOT in Linus's tree just yet.
> Please let stable@vger know when it does hit Linus's tree and we will be
> glad to take it.

Doh, of course, it is in next and not linus tree, now it makes sense.
I'll wait a bit until it is there and revisit this, unless it gets 
picked automatically by the Fixes tag.

Sorry for the noise.
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
