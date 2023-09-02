Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id BC51B79126B
	for <lists+linux-stm32@lfdr.de>; Mon,  4 Sep 2023 09:41:40 +0200 (CEST)
Received: from ip-172-31-3-47.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id 5ACF1C6B469;
	Mon,  4 Sep 2023 07:41:40 +0000 (UTC)
Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com
 [162.62.57.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 0D77FC6A613
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sat,  2 Sep 2023 04:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1693629738;
 bh=VDeJU94IWnvseyKaMxC4IUln27g8AmHmoNXDqEplCe8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=LkVhl7Tw1XoBWDKsxT8iWaFBUDhACP8sUZDECEndI52B3TwNCAPJCjTUf/zx26KWm
 t3mWgxVqoaIAJ5LDF8fR/PBPVEsjrLzmZbcQO75Rd5HQpx6We366cUHdJJL/JBWicA
 smn82tgqDCRcq6rGDdFCuq8+agLvcNe072FduVak=
Received: from rtoax.lan ([120.245.114.63])
 by newxmesmtplogicsvrsza12-0.qq.com (NewEsmtp) with SMTP
 id A4223C8B; Sat, 02 Sep 2023 12:41:02 +0800
X-QQ-mid: xmsmtpt1693629710t5d0r7m38
Message-ID: <tencent_51C8597C97032AF5AFDAA30C887206014208@qq.com>
X-QQ-XMAILINFO: OUUXHEo9i1ukFJYgSO1dj9mwONQKPyftWMC5kUq9pKAIUP2tf+OHYc6I9HtYAo
 0f/3PO0B89VA74pYjo2DdVEIauYDaRoTfC/fxGDITJPujGHJDeyNGhoELfvoSafZFrz8N0I1Iwx/
 b5wnVASGROPcyRToyEOmu4Rz028wqnA91sDkamJRvqvJvToBng6ow7WFal2FSRl+iz4DHAekn27S
 Y+Aev9kKWjxfNh1atT9Io/mpSrNg/0kJt8jZxG1jFnLlMT13jT0/nfcJ9zlaSEHNsrYCdkmbfAjo
 uBsgsbn/tv04U5TqmT0zGJBMvSLOgS6iEcbL42cKYqeEVieSCrkTYZgb9J1aw5ZgRrAUyC1mxpOR
 qJs9KF8nyVoMOTq0Jd/MJNXQjmwqQPENuk3/oeVwcWsU79j0AhKwWnYdDbF1z6AIEHDQZwamJ3Ek
 b6I7Qs891Z6CYjheDKyVdJBourSAfgfnaWgQ3W6TCPa7F2LJdvndwY1fxm1v9zrT+i24FnxsKijV
 47P+BPxXknxt5RgTMvkfHeWAdPyKw1crODvsOsEGU19La88qzRmwO24wussXD982sNjJTgf11jGY
 m6He9LF8i6XHshm80wZCvObkHjBdStTOBcs/4qYBLZf1Wshi6+uOKj2aPVzRC1c5qp5BwfEnB9dZ
 awYQEjtmuLXBglrdOLZzBLnHlgVEmhe38VTjqVNA3LA4+Mp8jXpQuawh1zvvtLyLzAI15Oyomg/1
 nWl9De49ikMIlgXQCobvBWVPATu3h0eCf4W89BVufWF0xl6OX0NMwAaU+DN7LdhbS7QfD/JBXEh9
 qXyQI6uSl4rCI+i8lBE10blxb+5WFO/IsECuJQnc1d3vBo646W4+sspxPh7MHZlt9AszkWq01rZP
 wg1yWqZ7AoUx+54hGZ61gWlbaj42ncOHAF+xl+duHm7YkKvgFZtL+Yy+Q2Dl98tK7d69w+sIv2DW
 crF9/kDKBIcbyZGxJDCldrA6qnI/E0o9n2Uqj+X5BbpGES4l3JNp10kQFsdZTLTxTHJavji3zW1n
 IPf1Xi53Pw+YzJ+55e
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: olsajiri@gmail.com, andrii@kernel.org, daniel@iogearbox.net, sdf@google.com
Date: Sat,  2 Sep 2023 12:40:19 +0800
X-OQ-MSGID: <20230902044040.137804-3-rtoax@foxmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902044040.137804-1-rtoax@foxmail.com>
References: <20230902044040.137804-1-rtoax@foxmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 04 Sep 2023 07:41:38 +0000
Cc: "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Hao Luo <haoluo@google.com>,
 Mykola Lysenko <mykolal@fb.com>, open list <linux-kernel@vger.kernel.org>,
 Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 KP Singh <kpsingh@kernel.org>, Song Liu <song@kernel.org>,
 Yafang Shao <laoar.shao@gmail.com>, Rong Tao <rongtao@cestc.cn>,
 Yonghong Song <yonghong.song@linux.dev>,
 "open list:BPF \[GENERAL\] Safe Dynamic Programs and Tools"
 <bpf@vger.kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Subject: [Linux-stm32] [PATCH bpf-next v10 2/2] selftests/bpf:
	trace_helpers.c: Add a global ksyms initialization mutex
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

From: Rong Tao <rongtao@cestc.cn>

As Jirka said [0], we just need to make sure that global ksyms
initialization won't race.

[0] https://lore.kernel.org/lkml/ZPCbAs3ItjRd8XVh@krava/

Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 tools/testing/selftests/bpf/trace_helpers.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/trace_helpers.c b/tools/testing/selftests/bpf/trace_helpers.c
index d64c4ef336e1..500b60226e5e 100644
--- a/tools/testing/selftests/bpf/trace_helpers.c
+++ b/tools/testing/selftests/bpf/trace_helpers.c
@@ -7,6 +7,7 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <poll.h>
+#include <pthread.h>
 #include <unistd.h>
 #include <linux/perf_event.h>
 #include <sys/mman.h>
@@ -26,6 +27,7 @@ struct ksyms {
 };
 
 static struct ksyms *ksyms;
+static pthread_mutex_t ksyms_mutex = PTHREAD_MUTEX_INITIALIZER;
 
 static int ksyms__add_symbol(struct ksyms *ksyms, const char *name,
 							 unsigned long addr)
@@ -115,8 +117,10 @@ struct ksyms *load_kallsyms_local(void)
 
 int load_kallsyms(void)
 {
+	pthread_mutex_lock(&ksyms_mutex);
 	if (!ksyms)
 		ksyms = load_kallsyms_local();
+	pthread_mutex_unlock(&ksyms_mutex);
 	return ksyms ? 0 : 1;
 }
 
-- 
2.41.0

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
