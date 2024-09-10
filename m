Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A697394B
	for <lists+linux-stm32@lfdr.de>; Tue, 10 Sep 2024 16:04:35 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 3D777C78011;
	Tue, 10 Sep 2024 14:04:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 1FA3FC712A2
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 14:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1725977067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wVYD4N62UqAhpHQm7sf1NxFCYsljgVEeGS+EzoqlJE0=;
 b=WJviZWrE4Q0AuHMuc1ZA+f3ZA5I2de4LapfHZJJhIIJxtvmobyfLOR6aun4PRGXizOwqtE
 eoSdz5WyhVIrDf/CYqoiPX+2i2zEU9JF3LSLTFyvf5wG4NTGlh9+nxKlQi1E+qEljYIchy
 Vcz+neapZk9p6mA8lSO1BMsNLrfeXpE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-_fnId6hbOPG7rbxXf6HMkw-1; Tue, 10 Sep 2024 10:04:26 -0400
X-MC-Unique: _fnId6hbOPG7rbxXf6HMkw-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7a9a7eed5b2so771186485a.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 10 Sep 2024 07:04:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725977065; x=1726581865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wVYD4N62UqAhpHQm7sf1NxFCYsljgVEeGS+EzoqlJE0=;
 b=XP5AJkOKV9D5noM8f70NVcF4jjWERVHGgdpP0/w/Km6ltGiuUdf5EYsu3Qd61B+mO2
 b7RPsVU3b3i6E7Ss36IyzqToCwaqcMK9+VTwEBSwDwR0SjSozID9zC6VPIcUAVPiA49/
 N8D9DFTddnmEKQWDBgsUeTjVufWsqJdXLHoCXs0U08ZvPbeeLPVSn90TbTmvlpP3qFqt
 YSmGo8cr2kfmFXjA+oR1KK20m7uL+sIpupiF8p1rtBF9QLUOfphD5Md0bAiLLceEMqJX
 hxSW+eNXjtBbpUiTj/1nr+RsMQiIo5aExh99ih1kUbd+sSb1S9qqt2J39fM50hHGj9iL
 iSuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHp3l4JpalSnQN6qBmiuwcPKNJBhmFutv2YyIujtXpexE8u2sga//B6CtZ8gXcrYDPAxFVwQW62+bAiw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0YwfMkTG4Y6FdvExrvUjk9wQZsYQabu8C9n+NZT84eRI7ug0zPZm
 oHWGKmxVEjsVgeQJopOjvW0yiac5KzuLkzNn7tDQieZkLmbJae4uKAqkrAmiSraV+zen6jKqwWN
 5P0fydY9XaQyU2qC0xRYIVsPjesejXDXWy8tgYV0Bfo4hJCfGCWdLKd935LbFbBiof+D38gc7pb
 yRIA==
X-Received: by 2002:a05:620a:4106:b0:7a9:a744:f9b0 with SMTP id
 af79cd13be357-7a9bf95d81dmr510766285a.2.1725977065432; 
 Tue, 10 Sep 2024 07:04:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgXAGMf5OXe+BFXu00quJBvXmiHAnCbYBL7DVhW0+OpqjaYfAmdX2DFJorJf2F1JO2aZaOcw==
X-Received: by 2002:a05:620a:4106:b0:7a9:a744:f9b0 with SMTP id
 af79cd13be357-7a9bf95d81dmr510760885a.2.1725977064867; 
 Tue, 10 Sep 2024 07:04:24 -0700 (PDT)
Received: from x1gen2nano ([2600:1700:1ff0:d0e0::33])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6c5347747d7sm30159556d6.126.2024.09.10.07.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2024 07:04:23 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:04:20 -0500
From: Andrew Halaney <ahalaney@redhat.com>
To: Suraj Jaiswal <jsuraj@qti.qualcomm.com>
Message-ID: <ypfbzhjyqqwwzciifkwvhimrolg6haiysqmxamkhnryez4npxx@l4blfw43sxgt>
References: <20240902095436.3756093-1-quic_jsuraj@quicinc.com>
 <yy2prsz3tjqwjwxgsrumt3qt2d62gdvjwqsti3favtfmf7m5qs@eychxx5qz25f>
 <CYYPR02MB9788F524C9A5B3471871E055E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CYYPR02MB9788F524C9A5B3471871E055E79A2@CYYPR02MB9788.namprd02.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "Suraj Jaiswal \(QUIC\)" <quic_jsuraj@quicinc.com>,
 Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, Rob Herring <robh@kernel.org>,
 kernel <kernel@quicinc.com>, Jose Abreu <joabreu@synopsys.com>,
 Andy Gross <agross@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Prasad Sodagudi <psodagud@quicinc.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 "bhupesh.sharma@linaro.org" <bhupesh.sharma@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH net] net: stmmac: Stop using a single
 dma_map() for multiple descriptors
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

Hey Suraj,

Your email client didn't seem to quote my response in your latest reply,
so its difficult to figure out what you're writing vs me below. It also
seems to have messed with the line breaks so I'm manually redoing those.

Please see if you can figure out how to make that happen for further
replies!

More comments below...

On Tue, Sep 10, 2024 at 12:47:08PM GMT, Suraj Jaiswal wrote:
> 
> 
> -----Original Message-----
> From: Andrew Halaney <ahalaney@redhat.com> 
> Sent: Wednesday, September 4, 2024 3:47 AM
> To: Suraj Jaiswal (QUIC) <quic_jsuraj@quicinc.com>
> Cc: Vinod Koul <vkoul@kernel.org>; bhupesh.sharma@linaro.org; Andy Gross <agross@kernel.org>; Bjorn Andersson <andersson@kernel.org>; Konrad Dybcio <konrad.dybcio@linaro.org>; David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Conor Dooley <conor+dt@kernel.org>; Alexandre Torgue <alexandre.torgue@foss.st.com>; Jose Abreu <joabreu@synopsys.com>; Maxime Coquelin <mcoquelin.stm32@gmail.com>; netdev@vger.kernel.org; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-stm32@st-md-mailman.stormreply.com; Prasad Sodagudi <psodagud@quicinc.com>; Rob Herring <robh@kernel.org>; kernel <kernel@quicinc.com>
> Subject: Re: [PATCH net] net: stmmac: Stop using a single dma_map() for multiple descriptors
> 
> WARNING: This email originated from outside of Qualcomm. Please be wary of any links or attachments, and do not enable macros.
> 
> On Mon, Sep 02, 2024 at 03:24:36PM GMT, Suraj Jaiswal wrote:
> > Currently same page address is shared
> > between multiple buffer addresses and causing smmu fault for other 
> > descriptor if address hold by one descriptor got cleaned.
> > Allocate separate buffer address for each descriptor for TSO path so 
> > that if one descriptor cleared it should not clean other descriptor 
> > address.

snip...

> >
> >  static void stmmac_flush_tx_descriptors(struct stmmac_priv *priv, int 
> > queue) @@ -4351,25 +4380,17 @@ static netdev_tx_t stmmac_tso_xmit(struct sk_buff *skb, struct net_device *dev)
> >               pay_len = 0;
> >       }
> >
> > -     stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);
> > +     if (stmmac_tso_allocator(priv, (skb->data + proto_hdr_len),
> > +                              tmp_pay_len, nfrags == 0, queue, false))
> > +             goto dma_map_err;
> 
> Changing the second argument here is subtly changing the dma_cap.addr64 <= 32
> case right before this. Is that intentional?
> 
> i.e., prior, pretend des = 0 (side note but des is a very confusing variable
> name for "dma address" when there's also mentions of desc meaning "descriptor"
> in the DMA ring). In the <= 32 case, we'd call stmmac_tso_allocator(priv, 0)
> and in the else case we'd call stmmac_tso_allocator(priv, 0 + proto_hdr_len).
> 
> With this change in both cases its called with the (not-yet-dma-mapped)
> skb->data + proto_hdr_len always (i.e. like the else case).
> 
> Honestly, the <= 32 case reads weird to me without this patch. It seems some
> of the buffer is filled but des is not properly incremented?
> 
> I don't know how this hardware is supposed to be programmed (no databook
> access) but that seems fishy (and like a separate bug, which would be nice to
> squash if so in its own patch). Would you be able to explain the logic there
> to me if it does make sense to you?
> 

> <Suraj> des can not be 0 . des 0 means dma_map_single() failed and it will return.
> If we see if des calculation (first->des1 = cpu_to_le32(des + proto_hdr_len);)
> and else case des calculator ( des += proto_hdr_len;) it is adding proto_hdr_len
> to the memory that we after mapping skb->data using dma_map_single.
> Same way we added proto_hdr_len in second argument . 


0 was just an example, and a confusing one, sorry. Let me paste the original
fishy code that I think you've modified the behavior for. Here's the
original:

	if (priv->dma_cap.addr64 <= 32) {
		first->des0 = cpu_to_le32(des);

		/* Fill start of payload in buff2 of first descriptor */
		if (pay_len)
			first->des1 = cpu_to_le32(des + proto_hdr_len);

		/* If needed take extra descriptors to fill the remaining payload */
		tmp_pay_len = pay_len - TSO_MAX_BUFF_SIZE;
	} else {
		stmmac_set_desc_addr(priv, first, des);
		tmp_pay_len = pay_len;
		des += proto_hdr_len;
		pay_len = 0;
	}

	stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue);

Imagine the <= 32 case. Let's say des is address 0 (just for simplicity
sake, let's assume that's valid). That means:

    first->des0 = des;
    first->des1 = des + proto_hdr_len;
    stmmac_tso_allocator(priv, des, tmp_pay_len, (nfrags == 0), queue)

    if des is 0, proto_hdr_len is 64, then that means

    first->des0 = 0
    first->des1 = 64
    stmmac_tso_allocator(priv, 0, tmp_pay_len, (nfrags == 0), queue)

That seems fishy to me. We setup up the first descriptor with the
beginning of des, and then the code goes and sets up more descriptors
(stmmac_tso_allocator()) starting with the same des again?

Should we be adding the payload length (TSO_MAX_BUFF_SIZE I suppose
based on the tmp_pay_len = pay_len - TSO_MAX_BUFFSIZE above)? It seems
that <= 32 results in duplicate data in both the "first" descriptor
programmed above, and in the "second" descriptor programmed in
stmmac_tso_allocator(). Also, since tmp_pay_len is decremented, but des
isn't, it seems that stmmac_tso_allocator() would not put all of the
buffer in the descriptors and would leave the last TSO_MAX_BUFF_SIZE
bytes out?

I highlight all of this because with your change here we get the
following now in the <= 32 case:

    first->des0 = des
    first->des1 = des + proto_hdr_len
    stmmac_tso_allocator(priv, des + proto_hdr_len, ...)

which is a subtle change in the call to stmmac_tso_allocator, meaning
a subtle change in the descriptor programming.

Both seem wrong for the <= 32 case, but I'm "reading between the lines"
with how these descriptors are programmed (I don't have the docs to back
this up, I'm inferring from the code). It seems to me that in the <= 32
case we should have:

    first->des0 = des
    first->des1 = des + proto_hdr_len
    stmmac_tso_allocator(priv, des + TSO_MAX_BUF_SIZE, ...)

or similar depending on if that really makes sense with how des0/des1 is
used (the handling is different in stmmac_tso_allocator() for <= 32,
only des0 is used so I'm having a tough time figuring out how much of
the des is actually programmed in des0 + des1 above without knowing the
hardware better).

Does that make sense? The prior code seems fishy to me, your change
seems to unintentionally change that fhsy part, but it still seems fishy
to me. I don't think you should be changing that code's behavior in that
patch, if you think it's right then we should continue with the current
behavior prior to your patch, and if you think its wrong we should
probably fix that *prior* to this patch in your series.

Thanks,
Andrew

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
