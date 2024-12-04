Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id EE05D9E3C13
	for <lists+linux-stm32@lfdr.de>; Wed,  4 Dec 2024 15:06:15 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 92FDFC71292;
	Wed,  4 Dec 2024 14:06:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 116CEC7128A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Wed,  4 Dec 2024 14:06:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A6871063;
 Wed,  4 Dec 2024 06:06:35 -0800 (PST)
Received: from [10.57.91.76] (unknown [10.57.91.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B03393F71E;
 Wed,  4 Dec 2024 06:06:03 -0800 (PST)
Message-ID: <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
Date: Wed, 4 Dec 2024 14:06:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thierry Reding <thierry.reding@gmail.com>, Furong Xu <0x1207@gmail.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com> <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com> <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
Cc: Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Thierry Reding <treding@nvidia.com>, "David S. Miller" <davem@davemloft.net>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jon Hunter <jonathanh@nvidia.com>, Eric Dumazet <edumazet@google.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Will Deacon <will@kernel.org>, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net v1] net: stmmac: TSO: Fix unbalanced
 DMA map/unmap for non-paged SKB data
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

On 2024-12-04 1:57 pm, Thierry Reding wrote:
> On Tue, Dec 03, 2024 at 11:16:37AM +0800, Furong Xu wrote:
>> On Mon, 2 Dec 2024 18:34:25 -0800, Jakub Kicinski <kuba@kernel.org> wrote:
>>
>>> On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
>>>> I requested Jon to provide more info about "Tx DMA map failed" in previous
>>>> reply, and he does not respond yet.
>>>
>>> What does it mean to provide "more info" about a print statement from
>>> the driver? Is there a Kconfig which he needs to set to get more info?
>>> Perhaps you should provide a debug patch he can apply on his tree, that
>>> will print info about (1) which buffer mapping failed (head or frags);
>>> (2) what the physical address was of the buffer that couldn't be mapped.
>>
>> A debug patch to print info about buffer makes no sense here.
>> Both Tegra186 Jetson TX2(tegra186-p2771-0000) and Tegra194 Jetson AGX Xavier
>> (tegra194-p2972-0000) enable IOMMU/SMMU for stmmac in its device-tree node,
>> buffer info should be investigated with detailed IOMMU/SMMU debug info from
>> drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c together.
>>
>> I am not an expert in IOMMU, so I cannot help more.
>>
>> Without the help from Jon, our only choice is revert as you said.
> 
> I was able to reproduce this locally and I get this splat:
> 
> --- >8 ---
> [  228.179234] WARNING: CPU: 0 PID: 0 at drivers/iommu/io-pgtable-arm.c:346 __arm_lpae_map+0x388/0x4e4
> [  228.188300] Modules linked in: snd_soc_tegra210_mixer snd_soc_tegra210_admaif snd_soc_tegra_pcm snd_soc_tegra186_asrc snd_soc_tegra210_ope snd_soc_tegra210_adx snd_soc_tegra210_mvc snd_soc_tegra210_dmic snd_soc_tegra186_dspk snd_soc_tegra210_sfc snd_soc_tegra210_amx snd_soc_tegra210_i2s tegra_drm drm_dp_aux_bus cec drm_display_helper drm_client_lib tegra210_adma snd_soc_tegra210_ahub drm_kms_helper snd_hda_codec_hdmi snd_hda_tegra snd_soc_tegra_audio_graph_card at24 snd_hda_codec ina3221 snd_soc_audio_graph_card snd_soc_simple_card_utils tegra_bpmp_thermal tegra_xudc snd_hda_core tegra_aconnect host1x fuse drm backlight ipv6
> [  228.243750] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S                 6.13.0-rc1-next-20241203 #30
> [  228.253412] Tainted: [S]=CPU_OUT_OF_SPEC
> [  228.257336] Hardware name: nvidia NVIDIA P2771-0000-500/NVIDIA P2771-0000-500, BIOS 2025.01-rc3-00040-g36352ae2e68e-dirty 01/01/2025
> [  228.269239] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  228.276205] pc : __arm_lpae_map+0x388/0x4e4
> [  228.280398] lr : __arm_lpae_map+0x120/0x4e4
> [  228.284587] sp : ffff8000800037f0
> [  228.287901] x29: ffff800080003800 x28: 0000000000000002 x27: 0000000000000001
> [  228.295050] x26: 0000000000000001 x25: 0000000111580000 x24: 0000000000001000
> [  228.302197] x23: 000000ffffc72000 x22: 0000000000000ec0 x21: 0000000000000003
> [  228.309342] x20: 0000000000000001 x19: ffff00008574b000 x18: 0000000000000001
> [  228.316486] x17: 0000000000000000 x16: 0000000000000001 x15: ffff800080003ad0
> [  228.323631] x14: ffff00008574d000 x13: 0000000000000000 x12: 0000000000000001
> [  228.330775] x11: 0000000000000001 x10: 0000000000000001 x9 : 0000000000001000
> [  228.337921] x8 : ffff00008674c390 x7 : ffff00008674c000 x6 : 0000000000000003
> [  228.345066] x5 : 0000000000000003 x4 : 0000000000000001 x3 : 0000000000000002
> [  228.352209] x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff00008574b000
> [  228.359356] Call trace:
> [  228.361807]  __arm_lpae_map+0x388/0x4e4 (P)
> [  228.366002]  __arm_lpae_map+0x120/0x4e4 (L)
> [  228.370198]  __arm_lpae_map+0x120/0x4e4
> [  228.374042]  __arm_lpae_map+0x120/0x4e4
> [  228.377886]  __arm_lpae_map+0x120/0x4e4
> [  228.381730]  arm_lpae_map_pages+0x108/0x250
> [  228.385922]  arm_smmu_map_pages+0x40/0x120
> [  228.390029]  __iommu_map+0xfc/0x1bc
> [  228.393525]  iommu_map+0x38/0xc0
> [  228.396759]  __iommu_dma_map+0xb4/0x1a4
> [  228.400604]  iommu_dma_map_page+0x14c/0x27c
> [  228.404795]  dma_map_page_attrs+0x1fc/0x280
> [  228.408987]  stmmac_tso_xmit+0x2d0/0xbac
> [  228.412920]  stmmac_xmit+0x230/0xd14
> [  228.416505]  dev_hard_start_xmit+0x94/0x11c
> [  228.420697]  sch_direct_xmit+0x8c/0x380
> [  228.424540]  __qdisc_run+0x11c/0x66c
> [  228.428121]  net_tx_action+0x168/0x228
> [  228.431875]  handle_softirqs+0x100/0x244
> [  228.435809]  __do_softirq+0x14/0x20
> [  228.439303]  ____do_softirq+0x10/0x20
> [  228.442972]  call_on_irq_stack+0x24/0x64
> [  228.446903]  do_softirq_own_stack+0x1c/0x40
> [  228.451091]  __irq_exit_rcu+0xd4/0x10c
> [  228.454847]  irq_exit_rcu+0x10/0x1c
> [  228.458343]  el1_interrupt+0x38/0x68
> [  228.461927]  el1h_64_irq_handler+0x18/0x24
> [  228.466032]  el1h_64_irq+0x6c/0x70
> [  228.469438]  default_idle_call+0x28/0x58 (P)
> [  228.473718]  default_idle_call+0x24/0x58 (L)
> [  228.477998]  do_idle+0x1fc/0x260
> [  228.481234]  cpu_startup_entry+0x34/0x3c
> [  228.485163]  rest_init+0xdc/0xe0
> [  228.488401]  console_on_rootfs+0x0/0x6c
> [  228.492250]  __primary_switched+0x88/0x90
> [  228.496270] ---[ end trace 0000000000000000 ]---
> [  228.500950] dwc-eth-dwmac 2490000.ethernet: Tx dma map failed
> --- >8 ---
> 
> This looks to be slightly different from what Jon was seeing. Looking at
> the WARN_ON() that triggers this, it seems like for some reason the page
> is getting mapped twice.
> 
> Not exactly sure why that would be happening, so adding Robin and Will,
> maybe they can shed some light on this from the ARM SMMU side.
> 
> Robin, Will, any idea who could be the culprit here? Is this a map/unmap
> imbalance or something else entirely?

If valid PTEs are getting left behind in the pagetable, that would 
indicate that a previous dma_unmap_page() was called with a size smaller 
than its original dma_map_page(). Throwing CONFIG_DMA_API_DEBUG at it 
should hopefully shed more light.

Cheers,
Robin.

> A lot of the context isn't present in this thread anymore, but here's a
> link to the top of the thread:
> 
> 	https://lore.kernel.org/netdev/d8112193-0386-4e14-b516-37c2d838171a@nvidia.com/T/
> 
> Thanks,
> Thierry

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
