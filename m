Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACC08037F2
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Dec 2023 15:59:36 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id D7776C6B46B;
	Mon,  4 Dec 2023 14:59:35 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 4AF39C6B469
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon,  4 Dec 2023 14:59:34 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-67a42549764so30533646d6.1
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Mon, 04 Dec 2023 06:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701701973; x=1702306773;
 darn=st-md-mailman.stormreply.com; 
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AEtXrarlRuJeVsqzYM4zb29M+XdIdGWvdhen3lEwn48=;
 b=ivBf3TQ8RZVkusLHU9H6XnugcZVMLSMYPcSXVLdiLn/OKsj2aew/BikOthEvWL0Hod
 lGHT82wsEkgnX77LgPrghR+RubcGNWxGusXS9pV5x/sOPb6N5v++h3PBb4H4Mu7SGQpJ
 e12FjhyIcWu7r/0sgWWeGG+LBG6UKApeuJZEG3c7aWZlDPhQTRGxdwwY+nqWPKquQva6
 o0SxIW++EXbyHrSNkSAUkPyc7l0ORKnBcK+K5pEmRVuly5UqS7ysdLVgqm1HzY/niJJQ
 7ArXbUDJnIznW8klmpyA4hMdXwK+CrG07YpSab8je31ZH2Lz3KVseAD/QtQIwoWibhRj
 DAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701701973; x=1702306773;
 h=content-transfer-encoding:mime-version:subject:references
 :in-reply-to:message-id:cc:to:from:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=AEtXrarlRuJeVsqzYM4zb29M+XdIdGWvdhen3lEwn48=;
 b=Dhe4drmxMdVcND4f9GP5jI6oX9u7wyATh6AW099tJzX7UwFYjwWNvsnRwyAJzrb/Rt
 Mua9Vd6R2pgiutNL4BmsNiY4jLLrEf7bpnUEMKo7POVHpZSeMbjlAfOUP3kQOMhYnv+j
 D8838QjHJtIQ9qbdoBhgt8nyAtGNSlNvLyZ4Xh5o/Is0Au7WUzoD34iTM4Rdk0hVYRh5
 cF/TO+TG7k8Kkybz+g2G+BIc2NyogZezYvar03UcIl9ynwtIEipnthk3YyU5pSWl6/np
 G7SHzuSZIwH11bPaN7CJjQ8Kc4KF1BT44lkVWVLyG/9waCaXnqwUmzYV6goc05dlVIPs
 GPqQ==
X-Gm-Message-State: AOJu0Yy77YQwj5uUPJd3zE1WEXOmvjijF9B69US9bPTZ/qdJlXXJmQKu
 1CS4qWsFxFarF6ZgpIn3z+I=
X-Google-Smtp-Source: AGHT+IF3TI2GZnZQV+WfJ1hnsDQUoFtybL3uFMJvxXaDS9FsOiVBo0wGKwsO+64zak8Bz9G8HmuLxw==
X-Received: by 2002:a05:6214:3902:b0:67a:b6a3:834e with SMTP id
 nh2-20020a056214390200b0067ab6a3834emr5393712qvb.127.1701701973169; 
 Mon, 04 Dec 2023 06:59:33 -0800 (PST)
Received: from localhost (114.66.194.35.bc.googleusercontent.com.
 [35.194.66.114]) by smtp.gmail.com with ESMTPSA id
 mh10-20020a056214564a00b0067a9235d5f0sm3704034qvb.105.2023.12.04.06.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 06:59:32 -0800 (PST)
Date: Mon, 04 Dec 2023 09:59:31 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, 
 Song Yoong Siang <yoong.siang.song@intel.com>, 
 "David S . Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Bjorn Topel <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@google.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, 
 Willem de Bruijn <willemb@google.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Mykola Lysenko <mykolal@fb.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>
Message-ID: <656de953bcc82_2e983e2949a@willemb.c.googlers.com.notmuch>
In-Reply-To: <8e20031c-83cb-4927-ab6a-e6b4840e1e42@kernel.org>
References: <20231203165129.1740512-1-yoong.siang.song@intel.com>
 <20231203165129.1740512-4-yoong.siang.song@intel.com>
 <8e20031c-83cb-4927-ab6a-e6b4840e1e42@kernel.org>
Mime-Version: 1.0
Cc: xdp-hints@xdp-project.net, linux-doc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [Linux-stm32] [PATCH bpf-next v3 3/3] selftests/bpf: add Launch
 Time request to xdp_hw_metadata
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

Jesper Dangaard Brouer wrote:
> 
> 
> On 12/3/23 17:51, Song Yoong Siang wrote:
> > This patch is tested with stmmac on Intel Tiger Lake platform. Refer to
> > result below, the delta between pre-determined launch time and actual HW
> > transmit complete time is around 24 us.
> 
> Is there any NIC setup (e.g. ethtool/qdisc) requirements to enable HW 
> for this feature?

Judging from how we currently use this with FQ and ETF, no.

See for instance tools/testing/selftests/net/so_txtime.sh

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
