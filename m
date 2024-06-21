Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA64912EBF
	for <lists+linux-stm32@lfdr.de>; Fri, 21 Jun 2024 22:45:06 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B634AC7128E;
	Fri, 21 Jun 2024 20:45:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 37697C6907A
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 20:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1719002697;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IBRyGrjkPd5CIS4XoIva4gQOV3Q+VtL43fiauuhlKtM=;
 b=Dafi+FP/qyGpDKLzX23XNpG8qrM/pJwq2EdI0pvvXo6fY6WLVDpeYRXttPPxMRA8CA21LB
 1QdzCEeIvi7o8yqTPPH19DWvNQs0/qaEgpWkSqE/FoXWoguaoZsiGWSHvPUy6d2CxH83cj
 fcfu/7DoUShRnxzLsHpoZqWRlGxcJ4U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-_IsUD7XZPIezToVecFXIwA-1; Fri, 21 Jun 2024 16:44:54 -0400
X-MC-Unique: _IsUD7XZPIezToVecFXIwA-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6b51db044edso16452736d6.2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Fri, 21 Jun 2024 13:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719002693; x=1719607493;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IBRyGrjkPd5CIS4XoIva4gQOV3Q+VtL43fiauuhlKtM=;
 b=CxXj8PWgmNiE4la950tYkUHgGjN+N0Q3db9wLkfWC3/gRQHjqra7x5yn24tCTet3Ee
 Plbcsxa6qJVDJJOVPCk7iumxCC2mJShMhDg5G7QKaEbp3n54ZVucnDlVNh1YqILejxh/
 crUTk0rYwXxDI9GeLAW3jndSzWBWXxgkCVi1Ax6+UP7PODG6y1h3FMKxN8nZ946S+y6A
 OkCR4CV0zo+gAVBcWYCuQxUjH+PAmJWxIllqmKMCfT70pXJTCvG3vAM4DPGlB7Bzfq2Q
 8ABjg9LeIaQpGJhdw5Sk6Dl39VeNvofbc5gibrq08z+Ng8b7Cw5dDqLaLGzyIV5Vt16a
 XHPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUb46kTiBu1ItXWX7rWrMJiZ7bhdzV93FTeNMb6QIctGQ7naxKS0MJOK6ib6nPadRJzyUEzerDFQLD0+6T3XwD1HLEmFs2wo7PXKk15Y/vbnEMmrk3vigW2
X-Gm-Message-State: AOJu0Yyg3I24XMZALWOWL4VHWRrwrGl2jrzQkjpAAoVKBHi2b/CMoZSG
 RnRZ70JzbyGBhzdEv5ffjzghuQzpDLKdypQOq5wJOBcJX8WqmqgL4FUnFs0OE5ix1Kh7kqYlZsM
 Go8YZwHD97z0xYKBxpvBxgNJhAjTdh+Lv0gg7eNq5k9WTWfdWdfrTHICpKMOSnR6KuI5hGtNltK
 NFzw==
X-Received: by 2002:ad4:4e2a:0:b0:6b2:cdaf:300e with SMTP id
 6a1803df08f44-6b501e03d2cmr96084186d6.1.1719002693501; 
 Fri, 21 Jun 2024 13:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpK5D9TDm/aP5jldornZZLwHdWh2EXn0K0pkw6eEyjdSKLkGZH9gNAROZfr7QzFOXxvhc+rQ==
X-Received: by 2002:ad4:4e2a:0:b0:6b2:cdaf:300e with SMTP id
 6a1803df08f44-6b501e03d2cmr96083876d6.1.1719002693102; 
 Fri, 21 Jun 2024 13:44:53 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b51ef30d47sm12047126d6.83.2024.06.21.13.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:44:52 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:44:50 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Andrew Lunn <andrew@lunn.ch>
Message-ID: <ymg2rf4vlp6kcsb6fbass3rntaxfz4ox4hbhcn56engfqcboqr@kp47u5rk3mvk>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
 <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
 <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>
 <b5096113-de85-485e-a226-a8112b3d5490@lunn.ch>
MIME-Version: 1.0
In-Reply-To: <b5096113-de85-485e-a226-a8112b3d5490@lunn.ch>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 kernel@quicinc.com, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>, devicetree@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH 1/3] net: stmmac: Add interconnect support
 in qcom-ethqos driver
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

On Fri, Jun 21, 2024 at 10:01:39PM GMT, Andrew Lunn wrote:
> > > This all looks pretty generic. Any reason why this is just in the
> > > Qualcomm device, and not at a higher level so it could be used for all
> > > stmmac devices if the needed properties are found in DT?
> > > 
> > >        Andrew
> > ICC is a software framework to access the NOC bus topology of the
> > system, all though "axi" and "ahb" buses seem generic but the 
> > topologies of these NOC's are specific to the vendors of synopsys chipset hence
> > this framework might not be applicable to all the vendors of stmmac driver.
> 
> There are however a number of SoCs using synopsys IP. Am i right in
> says they could all make use of this? Do we really want them to one by
> one copy/paste what you have here to other vendor specific parts of
> stmmac?
> 
> This code looks in DT. If there are no properties in DT, it does
> nothing. So in general it should be safe, right?

That logic makes sense to me, and thinking about it more you request a
"path" between two "endpoints" in the network, and that's pretty
generic. Sort of like the clocks, etc, and then let the provider figure
out the gory SoC specific details.

i.e., for example I see the UFS driver uses the paths "ufs-ddr" and
"cpu-ufs", and thinking about it generically for this IP that's probably
the same thing going on here (and lends weight to Krzysztof's request to
use names similar to other interconnect users).

That being said, grepping around I don't see users outside of platform
driver bits (i.e. I was hoping to see drivers/pci/controller/dwc/ doing
some shared usage, but that's not the case). Given what you said I'm
of the opinion now this should be done in stmmac_platform.c
and described for all stmmac users since it feels like a property of the
IP itself similar to the clocks required, etc. The interconnect framework handles
when they're not described in the dts gracefully so it shouldn't break any
other SoCs that don't describe interconnects currently.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
