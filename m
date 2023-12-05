Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1B08058D2
	for <lists+linux-stm32@lfdr.de>; Tue,  5 Dec 2023 16:34:34 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 57B54C6C820;
	Tue,  5 Dec 2023 15:34:34 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net
 (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id CAAAEC6A61D
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  5 Dec 2023 15:34:33 +0000 (UTC)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id
 20231205153432b9e60851bfec692816
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 05 Dec 2023 16:34:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=QLrrt7aQd3uFEGTkO/x97Sh3we90ObbwSexb6iVGv7A=;
 b=J+8+bbFXw8iqevTZ/1LFxb77bPK9BAi2TmeskopxbHBkn5POqgmVNCOYGcqwEep7uOPJpl
 zj+FDvGwqPNeHsljWo0kiWzfDFu9PDhQN6eGhzaJB7XFPDStPDo9SmhEyvxSfz3Nw8ezFswW
 bfVo1XvFDjaGtWxsO3vjq4Ss0mo2w=;
Message-ID: <5a0faf8cc9ec3ab0d5082c66b909c582c8f1eae6.camel@siemens.com>
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: "Song, Yoong Siang" <yoong.siang.song@intel.com>, Willem de Bruijn
 <willemdebruijn.kernel@gmail.com>, Jesper Dangaard Brouer
 <hawk@kernel.org>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Bjorn Topel
 <bjorn@kernel.org>, "Karlsson, Magnus" <magnus.karlsson@intel.com>,
 "Fijalkowski, Maciej" <maciej.fijalkowski@intel.com>, Jonathan Lemon
 <jonathan.lemon@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@google.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Willem de Bruijn <willemb@google.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrii Nakryiko
 <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, Hao Luo
 <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose
 Abreu <joabreu@synopsys.com>
Date: Tue, 05 Dec 2023 16:34:29 +0100
In-Reply-To: <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-3-yoong.siang.song@intel.com>
 <43b01013-e78b-417e-b169-91909c7309b1@kernel.org>
 <656de830e8d70_2e983e294ca@willemb.c.googlers.com.notmuch>
 <PH0PR11MB583000826591093B98BA841DD885A@PH0PR11MB5830.namprd11.prod.outlook.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer
Cc: "xdp-hints@xdp-project.net" <xdp-hints@xdp-project.net>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [Linux-stm32] [xdp-hints] Re: [PATCH bpf-next v3 2/3] net:
 stmmac: add Launch Time support to XDP ZC
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

On Tue, 2023-12-05 at 15:25 +0000, Song, Yoong Siang wrote:
> On Monday, December 4, 2023 10:55 PM, Willem de Bruijn wrote:
> > Jesper Dangaard Brouer wrote:
> > > 
> > > 
> > > On 12/3/23 17:51, Song Yoong Siang wrote:
> > > > This patch enables Launch Time (Time-Based Scheduling) support to XDP zero
> > > > copy via XDP Tx metadata framework.
> > > > 
> > > > Signed-off-by: Song Yoong Siang<yoong.siang.song@intel.com>
> > > > ---
> > > >   drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
> > > 
> > > As requested before, I think we need to see another driver implementing
> > > this.
> > > 
> > > I propose driver igc and chip i225.
> 
> Sure. I will include igc patches in next version.
> 
> > > 
> > > The interesting thing for me is to see how the LaunchTime max 1 second
> > > into the future[1] is handled code wise. One suggestion is to add a
> > > section to Documentation/networking/xsk-tx-metadata.rst per driver that
> > > mentions/documents these different hardware limitations.  It is natural
> > > that different types of hardware have limitations.  This is a close-to
> > > hardware-level abstraction/API, and IMHO as long as we document the
> > > limitations we can expose this API without too many limitations for more
> > > capable hardware.
> 
> Sure. I will try to add hardware limitations in documentation. 
> 
> > 
> > I would assume that the kfunc will fail when a value is passed that
> > cannot be programmed.
> > 
> 
> In current design, the xsk_tx_metadata_request() dint got return value. 
> So user won't know if their request is fail. 
> It is complex to inform user which request is failing. 
> Therefore, IMHO, it is good that we let driver handle the error silently.
> 

If the programmed value is invalid, the packet will be "dropped" / will
never make it to the wire, right?

That is clearly a situation that the user should be informed about. For
RT systems this normally means that something is really wrong regarding
timing / cycle overflow. Such systems have to react on that situation.

>  
> 
> > What is being implemented here already exists for qdiscs. The FQ
> > qdisc takes a horizon attribute and
> > 
> >    "
> >    when a packet is beyond the horizon
> >        at enqueue() time:
> >        - either drop the packet (default policy)
> >        - or cap its delivery time to the horizon.
> >    "
> >    commit 39d010504e6b ("net_sched: sch_fq: add horizon attribute")
> > 
> > Having the admin manually configure this on the qdisc based on
> > off-line knowledge of the device is more fragile than if the device
> > would somehow signal its limit to the stack.
> > 
> > But I don't think we should add enforcement of that as a requirement
> > for this xdp extension of pacing.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
