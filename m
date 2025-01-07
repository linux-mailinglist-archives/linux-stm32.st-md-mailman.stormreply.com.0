Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 853E8A06134
	for <lists+linux-stm32@lfdr.de>; Wed,  8 Jan 2025 17:13:05 +0100 (CET)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 2438CC78F6D;
	Wed,  8 Jan 2025 16:13:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 31F5CC78018
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue,  7 Jan 2025 16:57:38 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-216401de828so219721625ad.3
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Tue, 07 Jan 2025 08:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736269057; x=1736873857;
 darn=st-md-mailman.stormreply.com; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Rb1pOcXu31lYFeGfpMgDjeg52e6mYQb5OHgfqtIS2po=;
 b=dad8gi7+S1NLM21ZrHJv5sqOUNa1MZ+Qd09M/SmWTt3KzT2JzRVSaeAQnQjkdSWcZM
 v2oR4Iuw6JJqqcTWZijRQ4vEa4dJezOvYDdFrDJ06uBWaysgx2gY7TaWzCduuB+2pO6c
 nO/ac5c5TRZzuUg0esYmt6bctH92Mx4s5mV8bx/SA7a+sOYATw3kKjHenCbTnINkAT8p
 0KxcR/LfuD51gDbt4AC5/g976ZSMC5IU0N69Lt75pJy6zKfliviojRSD6YQDm1taMNuE
 32jKxjjAKE1G6/mO5YYf3skdrluWn8SJRcNVSJFxRd0tt4vQyWg4PcmWApWSxQW7W3qf
 2sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736269057; x=1736873857;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rb1pOcXu31lYFeGfpMgDjeg52e6mYQb5OHgfqtIS2po=;
 b=P/Xf3Tz+ELYVTw/zzwog5UOoxWyoA5L57dW/rfCpzFoxGruyoIzVb+5O1TRi/c+DnY
 fQyTFlsQg4hk87y4MGX1qptDGlKDD7i78DsOttWu7IOWV2JG+mGmDRc8vRM7QucRiD9g
 lAGRba6qYoozXtkO3YcosN4yLrgoOTtci4a1pxykZLL9bNtSmlVSQE6DHPFac83Cef77
 zR7TIOupvX4wF5zp1IN2tfTPFlJHypeIA2hGVkQ0rclI8INic5q7DKnernkRwThQqSKR
 FMd+rDxDSiO2aSh6fubAntyyVD1laz/l3TIBFqaeDbzpJZN6E/Jnk58TQXXEcsR6ZdQZ
 JIMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWuAK3P/zPlT9ZSAHEr1fxvnTVbnkuGFdiBW9aRU7VYGT3lglxsl2A4WbxpnNZsqlkqLOaUJr2kvfqSJA==@st-md-mailman.stormreply.com
X-Gm-Message-State: AOJu0Yz3lu3UzthV/B7s+gvig1YQ4nK2uMerKwsTpDVL6bO6g4vHb9LS
 H0VqD+JQoOeQ+0RqxPJ0hV6Hi0NyP/QCtMsrJf+6/lomW1Yqtxc=
X-Gm-Gg: ASbGncuRycsapJBm9AiweelB6JMzE1+wQYbV+GjKNr0MAW7HbFJw1cjc9wkVFEE3ooT
 6pBTb44lUkNe+I65joY+TrEazW92XCdUrU/7JfHva6OGGnXg8rCU/gMVCLgGe6eTIUDMUsPvP1d
 W3FGmlZUAbmj/gRVI9XE+UqmCI5+/c+WQM4rGLS4T4sVeQzGslCW1RVCVHeB9vXpCYyfWASw3VF
 0cS1WUSXN2GREbBa6Xv7ce1Ynx070FAitnKOHQC1FALDZQvavK44vVS
X-Google-Smtp-Source: AGHT+IFlhKI33ii68VDZqo5j2PH+n5VdBpF5kgNaO5PfE/xaemL0ooS2ho/W9ZBFXWggOucM2FsUEA==
X-Received: by 2002:a17:903:182:b0:216:1eb9:4a48 with SMTP id
 d9443c01a7336-219e6f289a0mr710448725ad.56.1736269056620; 
 Tue, 07 Jan 2025 08:57:36 -0800 (PST)
Received: from localhost ([2601:646:9e00:f56e:123b:cea3:439a:b3e3])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc962d0asm314014085ad.53.2025.01.07.08.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2025 08:57:36 -0800 (PST)
Date: Tue, 7 Jan 2025 08:57:35 -0800
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Song Yoong Siang <yoong.siang.song@intel.com>
Message-ID: <Z31c_3j9MEP7Z3bd@mini-arch>
References: <20250106135638.9719-1-yoong.siang.song@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250106135638.9719-1-yoong.siang.song@intel.com>
X-Mailman-Approved-At: Wed, 08 Jan 2025 16:13:03 +0000
Cc: Jose Abreu <joabreu@synopsys.com>, linux-kselftest@vger.kernel.org,
 Florian Bezdeka <florian.bezdeka@siemens.com>, Joe Damato <jdamato@fastly.com>,
 Alexei Starovoitov <ast@kernel.org>, Song Liu <song@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Daniel Jurgens <danielj@nvidia.com>, Yonghong Song <yonghong.song@linux.dev>,
 Shuah Khan <shuah@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Mina Almasry <almasrymina@google.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 Mykola Lysenko <mykolal@fb.com>, xdp-hints@xdp-project.net,
 Donald Hunter <donald.hunter@gmail.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, linux-doc@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Andrii Nakryiko <andrii@kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, Stanislav Fomichev <sdf@fomichev.me>,
 intel-wired-lan@lists.osuosl.org, linux-arm-kernel@lists.infradead.org,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>, KP Singh <kpsingh@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Hao Luo <haoluo@google.com>,
 Willem de Bruijn <willemb@google.com>,
 Amritha Nambiar <amritha.nambiar@intel.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 Bjorn Topel <bjorn@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, bpf@vger.kernel.org,
 Martin KaFai Lau <martin.lau@linux.dev>,
 "David S . Miller" <davem@davemloft.net>
Subject: Re: [Linux-stm32] [PATCH bpf-next v4 2/4] selftests/bpf: Add Launch
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

On 01/06, Song Yoong Siang wrote:
> Add Launch Time hw offload request to xdp_hw_metadata. User can configure
> the delta of launch time to HW RX-time by using "-l" argument. The default
> delta is 100,000,000 nanosecond.
> 
> Signed-off-by: Song Yoong Siang <yoong.siang.song@intel.com>
> ---
>  tools/testing/selftests/bpf/xdp_hw_metadata.c | 30 +++++++++++++++++--
>  1 file changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/bpf/xdp_hw_metadata.c b/tools/testing/selftests/bpf/xdp_hw_metadata.c
> index 6f7b15d6c6ed..795c1d14e02d 100644
> --- a/tools/testing/selftests/bpf/xdp_hw_metadata.c
> +++ b/tools/testing/selftests/bpf/xdp_hw_metadata.c
> @@ -13,6 +13,7 @@
>   * - UDP 9091 packets trigger TX reply
>   * - TX HW timestamp is requested and reported back upon completion
>   * - TX checksum is requested
> + * - TX launch time HW offload is requested for transmission
>   */
>  
>  #include <test_progs.h>
> @@ -64,6 +65,8 @@ int rxq;
>  bool skip_tx;
>  __u64 last_hw_rx_timestamp;
>  __u64 last_xdp_rx_timestamp;
> +__u64 last_launch_time;
> +__u64 launch_time_delta_to_hw_rx_timestamp = 100000000; /* 0.1 second */
>  
>  void test__fail(void) { /* for network_helpers.c */ }
>  
> @@ -298,6 +301,8 @@ static bool complete_tx(struct xsk *xsk, clockid_t clock_id)
>  	if (meta->completion.tx_timestamp) {
>  		__u64 ref_tstamp = gettime(clock_id);
>  
> +		print_tstamp_delta("HW Launch-time", "HW TX-complete-time",
> +				   last_launch_time, meta->completion.tx_timestamp);
>  		print_tstamp_delta("HW TX-complete-time", "User TX-complete-time",
>  				   meta->completion.tx_timestamp, ref_tstamp);
>  		print_tstamp_delta("XDP RX-time", "User TX-complete-time",
> @@ -395,6 +400,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
>  	       xsk, ntohs(udph->check), ntohs(want_csum),
>  	       meta->request.csum_start, meta->request.csum_offset);
>  
> +	/* Set the value of launch time */
> +	meta->flags |= XDP_TXMD_FLAGS_LAUNCH_TIME;
> +	meta->request.launch_time = last_hw_rx_timestamp +
> +				    launch_time_delta_to_hw_rx_timestamp;
> +	last_launch_time = meta->request.launch_time;
> +	print_tstamp_delta("HW RX-time", "HW Launch-time", last_hw_rx_timestamp,
> +			   meta->request.launch_time);
> +
>  	memcpy(data, rx_packet, len); /* don't share umem chunk for simplicity */
>  	tx_desc->options |= XDP_TX_METADATA;
>  	tx_desc->len = len;
> @@ -402,10 +415,14 @@ static void ping_pong(struct xsk *xsk, void *rx_packet, clockid_t clock_id)
>  	xsk_ring_prod__submit(&xsk->tx, 1);
>  }
>  
> +#define SLEEP_PER_ITERATION_IN_US 10
> +#define SLEEP_PER_ITERATION_IN_NS (SLEEP_PER_ITERATION_IN_US * 1000)
> +#define MAX_ITERATION(x) (((x) / SLEEP_PER_ITERATION_IN_NS) + 500)
>  static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t clock_id)
>  {
>  	const struct xdp_desc *rx_desc;
>  	struct pollfd fds[rxq + 1];
> +	int max_iterations;
>  	__u64 comp_addr;
>  	__u64 addr;
>  	__u32 idx = 0;
> @@ -418,6 +435,9 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
>  		fds[i].revents = 0;
>  	}
>  
> +	/* Calculate max iterations to wait for transmit completion */
> +	max_iterations = MAX_ITERATION(launch_time_delta_to_hw_rx_timestamp);
> +
>  	fds[rxq].fd = server_fd;
>  	fds[rxq].events = POLLIN;
>  	fds[rxq].revents = 0;
> @@ -477,10 +497,10 @@ static int verify_metadata(struct xsk *rx_xsk, int rxq, int server_fd, clockid_t
>  					if (ret)
>  						printf("kick_tx ret=%d\n", ret);
>  

[..]

> -					for (int j = 0; j < 500; j++) {
> +					for (int j = 0; j < max_iterations; j++) {
>  						if (complete_tx(xsk, clock_id))
>  							break;
> -						usleep(10);
> +						usleep(SLEEP_PER_ITERATION_IN_US);

nit: instead of doing MAX_ITERATION/max_iterations, can we simplify this
to the following?

static u64 now(void)
{
	clock_gettime(...);
	return ts.tv_sec * NSEC_PER_SEC + ts.tv_nsec;
}

/* wait 5 seconds + cover launch time */
deadline = now() + 5 * NSEC_PER_SEC + launch_time_delta_to_hw_rx_timestamp;
while (true) {
	if (complete_tx())
		break;
	if (now() >= deadline)
		break;
	usleep(10);
}

It is a bit more readable than converting time to wait to the
iterations..
_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
