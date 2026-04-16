Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
Delivered-To: lists+linux-stm32@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGMVJtuZ4GlMkAAAu9opvQ
	(envelope-from <linux-stm32-bounces@st-md-mailman.stormreply.com>)
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 10:12:11 +0200
X-Original-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 512B140B5E8
	for <lists+linux-stm32@lfdr.de>; Thu, 16 Apr 2026 10:12:09 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 9F704C3F944;
	Thu, 16 Apr 2026 08:12:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id A3F2FC36B30
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 08:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776327127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dCw/fk1scpcEI5fTg9Hp2YTuYcflg1hd7U/WW44L5U8=;
 b=MB3xNR6KYko5QQkOYxUURByIW6M7+RGW0jMdhSkO//sIJ33Pf/avp/ReSMjTo4gpsNajnj
 gFCF6phvPj5iSSQ76cb/4WvVa239KtGw2eYydiTgmxqkrm7aoxYAvZNOv7juZ5g/tASKYS
 ziqqCVSvhDnJssFkXvLkl96JsBdBQw0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-YoB4dJedOoGzGV7jdy5zbg-1; Thu, 16 Apr 2026 04:12:06 -0400
X-MC-Unique: YoB4dJedOoGzGV7jdy5zbg-1
X-Mimecast-MFC-AGG-ID: YoB4dJedOoGzGV7jdy5zbg_1776327125
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-43efc93e4f6so361912f8f.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Thu, 16 Apr 2026 01:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776327125; x=1776931925;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dCw/fk1scpcEI5fTg9Hp2YTuYcflg1hd7U/WW44L5U8=;
 b=cqvD6BxQWIuDq3FTXag6A21Vu7jFU2sB8quNYzNNyqt6UcpaencRFYw9k+Gcm3TH9I
 zKI+L2BBtr6PfyeiEFtGD+zBN9EyTXSnIBq+jM/6PwHYgHzlKNtSxPKXEHvb+eoaKVOi
 zerrAO9NEszLByXF4BQFycucm4RmWemIaLJd70rrFMh5cHUeSHEhSqbMd6fRxHtpCzot
 PlQYt2tkZNU6vLj9gkjVMrryjMDMYiO9qdGV7KWbmXX7h+iEf39nUrKN0NiDLv+flFLh
 Qn16Kt+1ep+XrfZmZemPHA4xjL3mJp/LYvYUlTSObp0R3+xBS7dfbx1IXmE+MJ0PT0bj
 4Y8w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/DQksZwS6Mbfp2Y+OagD5rBddiyT8uE2U1r1m6QhvlrPQdx7dIqa/AyjzSlg+qoHYhBDRALZbHdQuWPw==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yx6U2roQbcyvmJ7VHb5P9+bkgkoIo/sDn5iY+q3saBvkMqSVYYq
 7K+jLr4GYODyC7sTyhd9xf/TjH6m+rLwxsg6R/g5p1dAf5/vwe2owXPoyPJnF8K/6EMxFV+pqLn
 4WNvL19h4Tg3dRYUOVxL8ASLfoKEMwJcI3S+bgz6nTxHzU+LaBNbcr2l62QvP05OWXCYUamAXm4
 Ezij9/4Q==
X-Gm-Gg: AeBDietPTl3t2zK5IvR4b6zJJr8Oqt9TsLALdbax/DzCuCs4X3Wd6S+ajv4suUI6uh3
 Wmwc/ggyAMDJtLshPthA6czPuq0IZAPTjDpXONAkJ+tVIYUmMrtBvaVKaG4483z+StatdBFGZlc
 cmxCfujuhkjmUvwDXmVjci/9+vHtryoHVqZXKSOwmz+ApQR1eCdrAnecczL4rY6W52XLsjmjIHv
 H5P1xp9JSJQUyfeQTYW2+yd6082m4eoIwI5j8eXqWGHO7B7sv8c8pr34Gy9+oeucWUUxBCt782k
 o/3PWZDemZK+ZsPUluaPj9yUUU5nrgw6DYlyihranOl+F4PBdclv879CIeEmmmWjmz5g5KylrsX
 QcVup7pZiOVbsY6/7Kt1CQu1Two9dvU5ufXzKOva+m8XX8s1dwJWdfOqorE2YKVxntHE=
X-Received: by 2002:a05:6000:2c02:b0:43d:75a2:44a1 with SMTP id
 ffacd0b85a97d-43d75a2463emr24016063f8f.47.1776327124786; 
 Thu, 16 Apr 2026 01:12:04 -0700 (PDT)
X-Received: by 2002:a05:6000:2c02:b0:43d:75a2:44a1 with SMTP id
 ffacd0b85a97d-43d75a2463emr24016016f8f.47.1776327124289; 
 Thu, 16 Apr 2026 01:12:04 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.93.122])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5ea9sm11794717f8f.21.2026.04.16.01.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 01:12:03 -0700 (PDT)
Message-ID: <72d1b0b7-c8df-463e-a2d9-bf5ff04ba33c@redhat.com>
Date: Thu, 16 Apr 2026 10:12:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: KhaiWenTan <khai.wen.tan@linux.intel.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, maxime.chevallier@bootlin.com,
 ovidiu.panait.rb@renesas.com, vladimir.oltean@nxp.com
References: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260413020339.68426-1-khai.wen.tan@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: H569ww2YQ5l6itLW9sldk_EV77bhvchwGC8ZMS9K0FE_1776327125
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 hong.aun.looi@intel.com, yoong.siang.song@intel.com, khai.wen.tan@intel.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH net,
 v2 1/1] net: stmmac: Update default_an_inband before passing value
 to phylink_config
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
X-Spamd-Result: default: False [4.79 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[redhat.com : SPF not aligned (relaxed),quarantine];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[redhat.com:s=mimecast20190719];
	HFILTER_HELO_IP_A(1.00)[stm-ict-prod-mailman-01.stormreply.prv];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[stm-ict-prod-mailman-01.stormreply.prv];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:52.209.6.89];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:khai.wen.tan@linux.intel.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:rmk+kernel@armlinux.org.uk,m:maxime.chevallier@bootlin.com,m:ovidiu.panait.rb@renesas.com,m:vladimir.oltean@nxp.com,m:netdev@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:hong.aun.looi@intel.com,m:yoong.siang.song@intel.com,m:khai.wen.tan@intel.com,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:andrew@lunn.ch,m:mcoquelinstm32@gmail.com,m:rmk@armlinux.org.uk,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linux.intel.com,lunn.ch,davemloft.net,google.com,kernel.org,gmail.com,foss.st.com,armlinux.org.uk,bootlin.com,renesas.com,nxp.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	GREYLIST(0.00)[pass,meta];
	ASN_FAIL(0.00)[89.6.209.52.asn.rspamd.com:server fail];
	FORWARDED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.069];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-stm32-bounces@st-md-mailman.stormreply.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-stm32@st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-stm32,netdev,kernel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,stm-ict-prod-mailman-01.stormreply.prv:helo,st-md-mailman.stormreply.com:rdns]
X-Rspamd-Queue-Id: 512B140B5E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 4:03 AM, KhaiWenTan wrote:
> get_interfaces() will update both the plat->phy_interfaces and
> mdio_bus_data->default_an_inband based on reading a SERDES register. As
> get_interfaces() will be called after default_an_inband had already been
> read, dwmac-intel regressed as a result with incorrect default_an_inband
> value in phylink_config.
> 
> Therefore, we moved the priv->plat->get_interfaces() to be executed first
> before assigning mdio_bus_data->default_an_inband to
> config->default_an_inband to ensure default_an_inband is in correct value.
> 
> Fixes: d3836052fe09 ("net: stmmac: intel: convert speed_mode_2500() to get_interfaces()")
> Signed-off-by: KhaiWenTan <khai.wen.tan@linux.intel.com>

Since Jakub sent the net-next PR and forwarded the trees, this patch
does not apply anymore. Please rebase and repost. You can retain
Russell's reviewed-by tag.

Thanks,

Paolo

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
