Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BF4640103
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Dec 2022 08:27:08 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E8242C65E62;
	Fri,  2 Dec 2022 07:27:07 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 3C61AC6506E
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Dec 2022 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
 MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References;
 bh=YqdG/sVsGpppFB4ly1ZzHyV7+aBNve0eyHvHaraNo80=; b=u8F5LPhQcpnA3XqBB7qTRNOPqS
 3K8ANgPfU5E2Yc+mR6bWHw9KVsfpANEswq9r0iBhnpO36CApSdqbclSnmHrHKv7rM0X+o86FiXiXW
 bkPv1yomDSw+w2tI42xj8SZZ4L8KbiSDuwroOAOOWKPSoqNabOUtiqhB//Q5NWnFVwEyAA/3SZcI5
 eKSTMyyfRHuBjqhwIZmcvfxsJnrnig1IWNTuuGXwjrjcXG4WQbuu1JYUFb9V14l5UJfRorhu43OSv
 WzIzfrfH1yRky9G+lGsdeDtG8ykOtqD99BA8lGdGThA3yaBpo2/W35kfDpTSSixJZfayzjrJKbUDp
 /XL7fYqw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1p10Rs-00082a-NW; Fri, 02 Dec 2022 08:27:04 +0100
Received: from [2a06:4004:10df:1:1df0:c65d:f90f:1c53]
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <sean@geanix.com>)
 id 1p10Rs-0008a6-De; Fri, 02 Dec 2022 08:27:04 +0100
Message-ID: <ff88a991-02da-f292-5958-c584344752c9@geanix.com>
Date: Fri, 2 Dec 2022 08:27:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Content-Language: en-US
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yann Gautier <yann.gautier@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Ludovic Barre <ludovic.barre@foss.st.com>, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
From: Sean Nyekjaer <sean@geanix.com>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26737/Thu Dec  1 09:22:33 2022)
Subject: [Linux-stm32] stm32mp157c eMMC DDR50 mode
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

Hi,

We are testing using the Octavo RED board with OSD32MP157c SoC 
(stm32mp157c).

We are using vanilla u-boot 2022.10(in basic mode without TF-A) and 
Linux kernel version 6.0.x.
I have ported the devicetree's from Octavo combined with upstream 
stm32mp1 boards.
But we are facing issues with running the eMMC in DDR50 mode, works fine 
in normal 50Mhz mode (without the mmc-ddr-3_3v in dts).

It works fine though, with the ST u-boot and ST Linux kernel.

One further note is it seems to work fine, when mounting a squashfs (aka 
readonly) in DDR50.

But ext4 fails with:
root@osd32mp1-red:~# mount /dev/mmcblk0p7 /media/
I/O error, dev mmcblk0, sector 1060144 op 0x1:(WRITE) flags 0x800 
phys_seg 1 prio class 2
Buffer I/O error on dev mmcblk0p7, logical block 422, lost async page write
I/O error, dev mmcblk0, sector 1060016 op 0x1:(WRITE) flags 0x800 
phys_seg 1 prio class 2
Buffer I/O error on dev mmcblk0p7, logical block 406, lost async page write
I/O error, dev mmcblk0, sector 1056768 op 0x1:(WRITE) flags 0x800 
phys_seg 2 prio class 2
Buffer I/O error on dev mmcblk0p7, logical block 0, lost async page write
Buffer I/O error on dev mmcblk0p7, logical block 1, lost async page write

/Sean
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
