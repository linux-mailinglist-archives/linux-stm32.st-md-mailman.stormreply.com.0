Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 91131946419
	for <lists+linux-stm32@lfdr.de>; Fri,  2 Aug 2024 21:52:24 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 41459C7129D;
	Fri,  2 Aug 2024 19:52:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id E9CEBC6B45B
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri,  2 Aug 2024 19:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722628336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SCsjNevSFiet/Sgy15L1fkfMNQj95z+afVS4JRle7eo=;
 b=Wtjd3rcY3l8+x7dbaUvJEAnqc3Q+SlkzREUWm+19Fm5QVxg6wyH6Zl3x0Ee5HG4QEoqXd2
 m9l1afgZ04miGGDS55DdtrSUv8CN2PtOx7j77lhgiKbbE1ksMJXSMRgRUQrg43Cc0IPNq2
 nLrBOmEvRc3WtYso+jqHDDd4zgTtYVA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-198-76EyBB-_NWq5vS1DbtSy7g-1; Fri, 02 Aug 2024 15:52:13 -0400
X-MC-Unique: 76EyBB-_NWq5vS1DbtSy7g-1
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-44f594e5605so116560911cf.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 02 Aug 2024 12:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722628333; x=1723233133;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCsjNevSFiet/Sgy15L1fkfMNQj95z+afVS4JRle7eo=;
 b=eOi/dwL0oOIeNFMxvqQHNjVGgibs9JJOzEN5cukBvIh5px1YozGgP+rZ6gT0fb9QvG
 24KVXNL0Qmmu9GOPoow32XwKrMk/X9YxRl3RkzZm2cL/9AnfI8bgXYUJWacH7yV0n4dg
 Vxn3gUoeb8qQwWQ/8qHJx7b0w9vSHPWX7N/F9Jpm9DjSbLB/Y4T81DvIeyqqfgGQ73En
 OEmUUEplvYdwqL3+mNJq5QE+ed55D8bXZJ/mehDxdY2gcEoUxJPDWEG99LkoDomQ41ph
 K+63RtaI5+Sd+BEiIRYNBIHwz4L2KqHXyiQcOstjbK8kktFFv52nMRwfa9OlglRmJvIG
 xgyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpCllPmSfKV0UFshDYk1L1af12avL+B/lWnUcBub/QlqQz8MQCn9naM+o6Fed9LxI7bV4EFlN11M/HVDWAVC2f/nG4LRnx/6+81ALZRf3z+qDbrOMEsaxV
X-Gm-Message-State: AOJu0YwwzrPWJKc+IfnZ1a8u8Z37WHBAokv96Jia/YgWWGDIOolhq6N6
 VZB9YdNDs6DX7oqDLpJ68udUszvlU2B/i6QmV7ptX79gfdT/PZLoqbrKKUAGezLj4uscu+/RC3O
 o/mtXNw3UVCy0RwLo4B35ItCT3s/gwBuvM0S1z1kRC/2pHHul3uLcNE+zz+m0qz675kRryLRoXE
 pcuw==
X-Received: by 2002:ac8:5709:0:b0:446:3c7a:3689 with SMTP id
 d75a77b69052e-4518929e48cmr45098751cf.43.1722628333183; 
 Fri, 02 Aug 2024 12:52:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQFUukQHhlMedRIzlWH4c8TXYeBXJnK/PmOlc0utWYdYqCu+TF87zFhfKYBnIx3afbcZp6gQ==
X-Received: by 2002:ac8:5709:0:b0:446:3c7a:3689 with SMTP id
 d75a77b69052e-4518929e48cmr45098561cf.43.1722628332832; 
 Fri, 02 Aug 2024 12:52:12 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4518a753eafsm9698351cf.62.2024.08.02.12.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 12:52:12 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:52:10 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Message-ID: <pjq4xwrfgbz7qix5okt7wbqccjcwojaurh6jp2myou53s5ao4h@4rizzerirz2x>
References: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
MIME-Version: 1.0
In-Reply-To: <Zqy4wY0Of8noDqxt@shell.armlinux.org.uk>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vinod Koul <vkoul@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 John Fastabend <john.fastabend@gmail.com>,
 Serge Semin <fancer.lancer@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH RFC v3 0/14] net: stmmac: convert stmmac
	"pcs" to phylink
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

On Fri, Aug 02, 2024 at 11:45:21AM GMT, Russell King (Oracle) wrote:
> Hi,
> 
> This is version 3 of the series switching stmmac to use phylink PCS
> isntead of going behind phylink's back.
> 
> Changes since version 2:
> - Adopted some of Serge's feedback.
> - New patch: adding ethqos_pcs_set_inband() for qcom-ethqos so we
>   have one place to modify for AN control rather than many.
> - New patch: pass the stmmac_priv structure into the pcs_set_ane()
>   method.
> - New patch: remove pcs_get_adv_lp() early, as this is only for TBI
>   and RTBI, support for which we dropped in an already merged patch.
> - Provide stmmac_pcs structure to encapsulate the pointer to
>   stmmac_priv, PCS MMIO address pointer and phylink_pcs structure.
> - Restructure dwmac_pcs_config() so we can eventually share code
>   with dwmac_ctrl_ane().
> - New patch: move dwmac_ctrl_ane() into stmmac_pcs.c, and share code.
> - New patch: pass the stmmac_pcs structure into dwmac_pcs_isr().
> - New patch: similar to Serge's patch, rename the PCS registers, but
>   use STMMAC_PCS_ as the prefix rather than just PCS_ which is too
>   generic.
> - New patch: incorporate "net: stmmac: Activate Inband/PCS flag
>   based on the selected iface" from Serge.
> 
> On the subject of whether we should have two PCS instances, I
> experimented with that and have now decided against it. Instead,
> dwmac_pcs_config() now tests whether we need to fiddle with the
> PCS control register or not.
> 
> Note that I prefer not to have multiple layers of indirection, but
> instead prefer a library-style approach, which is why I haven't
> turned the PCS support into something that's self contained with
> a method in the MAC driver to grab the RGSMII status.
> 

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sa8775p-ride

Note, I also tested with setting sa8775p-ride to:

    managed = "in-band-status";

and noticed no issues either when signalling was done in-band. Just
highlighting that since there's some comments referencing the lack of
in-band signalling with dwmac-qcom-ethqos usage in the series, but it
seems that's ok in either case.

I know there's the "sa8775p-ride-r3.dts" that was recently added,
running with "OCSGMII" (hacked up 2.5GHz SGMII IIUC), I can't test that
since I don't have that hardware. I think some of the remaining
interesting bits in the dwmac-qcom-ethqos driver are to handle that
(like the usage of ethqos_pcs_set_inband).

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
