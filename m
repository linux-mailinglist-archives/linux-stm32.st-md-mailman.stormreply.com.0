Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01E512E92
	for <lists+linux-stm32@lfdr.de>; Thu, 28 Apr 2022 10:34:38 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 867F8C6046D;
	Thu, 28 Apr 2022 08:34:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 78505C5F1EB
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651129564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RX0IluUFjyFGJB9XgIGY/YNKpJD21MjW7iyGoQ/bciQ=;
 b=MgCRQOR0bXRwCG/n9wB3V/1V5KF7AWuuzIMVPknPI4vVCSoQUbZH5PD17M/bicFwyCK9zd
 U/c+O6emWUPdgwPJC0U7hmZdBHcKzCzJPpiiZKIqxmIpg0F+bxXZzlHF14bswCE95j41Bt
 KWQsumSgUPpfKbM7Lxgo1yrCyjPR6xo=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-s9t4_kQWNSSUDU4imY5-KA-1; Thu, 28 Apr 2022 03:06:03 -0400
X-MC-Unique: s9t4_kQWNSSUDU4imY5-KA-1
Received: by mail-qv1-f69.google.com with SMTP id
 kj4-20020a056214528400b0044399a9bb4cso3055604qvb.15
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 28 Apr 2022 00:06:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=RX0IluUFjyFGJB9XgIGY/YNKpJD21MjW7iyGoQ/bciQ=;
 b=iO2ruxxkzGTC9paz0Rwe7Hyg8kLFW1zZEoh1M2VJJG/uDzUd4Up2jwxsC8+aiJIcmG
 XvPnSUnx9pq9Hu+BbM6Oqg3zaqYbi0CHOXGbgBAtqmf5i8Dy+HFruUdhb4MWsU61X9m8
 1vK9ZBA0Kbsq/6Np4JTRllM1yIJMlpBVnzkKHdxcVqKDK5sLFdSq5v1sk0ZOF1hCskFC
 PmkmSKNgo0PvjflMum/uX2G2g+8pANy04y/QP/e9eRGnUDcST+424v5YbT1foFLLLkwe
 fAjaIEyJD3jUT8qyxfPCIaH4c6/xNdhgDJU2AGUYpmn0SXGbF2CqYkPsJQ2UqatrQFTN
 zK0w==
X-Gm-Message-State: AOAM532LXMQIpTeN4kg3JTM+atX44AmlyhokiCAtz342ofSMQI3SQBTC
 ffgHBwPjBz5fbMFjR03w1ToH6pYgMyVzyDhoLyhTyYNsn1/+gDWajof0nHT4Dbu6PhHrMQz32U6
 TUf0q9yqZVMEyRcmtcrfdd7v1nql8xuJKASe6GMCb
X-Received: by 2002:ac8:5fcb:0:b0:2f3:4799:1649 with SMTP id
 k11-20020ac85fcb000000b002f347991649mr22339573qta.522.1651129562776; 
 Thu, 28 Apr 2022 00:06:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU2oeLrstNHTLoVNiOiYqy8PCp5qFcyD0PvqMZ6dBrsfSJtI6yAgZINx2lBg+bbQaYrXCEkQ==
X-Received: by 2002:ac8:5fcb:0:b0:2f3:4799:1649 with SMTP id
 k11-20020ac85fcb000000b002f347991649mr22339552qta.522.1651129562541; 
 Thu, 28 Apr 2022 00:06:02 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-117-160.dyn.eolo.it.
 [146.241.117.160]) by smtp.gmail.com with ESMTPSA id
 p13-20020a05622a048d00b002e1ce0c627csm11706888qtx.58.2022.04.28.00.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 00:06:02 -0700 (PDT)
Message-ID: <530adc71b52e774c92c53d235701710dbc9866a9.camel@redhat.com>
From: Paolo Abeni <pabeni@redhat.com>
To: Tan Tee Min <tee.min.tan@linux.intel.com>, Kurt Kanzenbach
 <kurt@linutronix.de>
Date: Thu, 28 Apr 2022 09:05:57 +0200
In-Reply-To: <20220428015538.GC26326@linux.intel.com>
References: <20220426074531.4115683-1-tee.min.tan@linux.intel.com>
 <8735i0ndy7.fsf@kurt> <20220428015538.GC26326@linux.intel.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pabeni@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Mailman-Approved-At: Thu, 28 Apr 2022 08:34:37 +0000
Cc: Song Yoong Siang <yoong.siang.song@intel.com>,
 Wong Vee Khee <vee.khee.wong@linux.intel.com>, linux-kernel@vger.kernel.org,
 Bhupesh Sharma <bhupesh.sharma@linaro.org>,
 Voon Wei Feng <weifeng.voon@intel.com>, Ong@vger.kernel.org,
 netdev@vger.kernel.org, Xiaoliang Yang <xiaoliang.yang_1@nxp.com>,
 Ling Pei Lee <pei.lee.ling@intel.com>,
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Boon Leong <boon.leong.ong@intel.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Tan Tee Min <tee.min.tan@intel.com>, "David S
 . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net 1/1] net: stmmac: disable Split Header
 (SPH) for Intel platforms
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

Hello,

On Thu, 2022-04-28 at 09:55 +0800, Tan Tee Min wrote:
> On Tue, Apr 26, 2022 at 03:58:56PM +0200, Kurt Kanzenbach wrote:
> > Hi,
> > 
> > On Tue Apr 26 2022, Tan Tee Min wrote:
> > > Based on DesignWare Ethernet QoS datasheet, we are seeing the limitation
> > > of Split Header (SPH) feature is not supported for Ipv4 fragmented packet.
> > > This SPH limitation will cause ping failure when the packets size exceed
> > > the MTU size. For example, the issue happens once the basic ping packet
> > > size is larger than the configured MTU size and the data is lost inside
> > > the fragmented packet, replaced by zeros/corrupted values, and leads to
> > > ping fail.
> > > 
> > > So, disable the Split Header for Intel platforms.
> > 
> > Does this issue only apply on Intel platforms?
> 
> According to Synopsys IP support, they have confirmed the header-payload
> splitting for IPv4 fragmented packets is not supported for the Synopsys
> Ether IPs.
> 
> Intel platforms are integrating with GMAC EQoS IP which is impacted by the
> limitation above, so we are changing the default SPH setting to disabled
> for Intel Platforms only.
> 
> If anyone can confirm on their platform also having the same issues,
> then we would change the SPH default to disable across the IPs.

Could you please provide a Fixes tag here? 

Thanks!

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
