Return-Path: <linux-stm32-bounces@st-md-mailman.stormreply.com>
X-Original-To: lists+linux-stm32@lfdr.de
Delivered-To: lists+linux-stm32@lfdr.de
Received: from stm-ict-prod-mailman-01.stormreply.prv (st-md-mailman.stormreply.com [52.209.6.89])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE4D3C3D24
	for <lists+linux-stm32@lfdr.de>; Sun, 11 Jul 2021 16:05:46 +0200 (CEST)
Received: from ip-172-31-3-76.eu-west-1.compute.internal (localhost [127.0.0.1])
	by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTP id B13C6C57B6B;
	Sun, 11 Jul 2021 14:05:45 +0000 (UTC)
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by stm-ict-prod-mailman-01.stormreply.prv (Postfix) with ESMTPS id 35EB2C3FAD6
 for <linux-stm32@st-md-mailman.stormreply.com>;
 Sun, 11 Jul 2021 14:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=opiyXzz03XSvATCVRQY9c1WK7Xfz/7xyqkaDVHpblnA=; b=fUrBhWtbCVrd2/MswDdJf3BmcI
 gGdKTBwUzBrOarv9W9KDAElabrY2h4DzMS7WhUpPq0qqVdEICnlwj+hPFRRK2jDDWfg9xDV9FmASi
 qlUIpSImfp56d28SrY+WB4CrhtDId+3+LGSVDPZmR5powvHKj0EDfGw5j+G1pz/d8mpjXw5y9HF5i
 oRpK3aeSGWYPLHuP5Tk9HBl8+lDkw3IlkUJUa3qndZxMwyDQJORADABi2+cBXW3CsR1rKp8DJ6BzV
 jQlJlfpCfsGsiO/bkNQmylp9UgcW34SykCbPyrhmuQQbrxGYJj48RkRFrdr7rlypLPMJIew1OpD29
 4qdDwXDw==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:51930 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m2a5R-003hqX-91; Sun, 11 Jul 2021 10:05:38 -0400
To: William Breathitt Gray <vilhelm.gray@gmail.com>
References: <cover.1625471640.git.vilhelm.gray@gmail.com>
 <e97aa3e529f54d5651df7edcc1b43a8157d9e9c3.1625471640.git.vilhelm.gray@gmail.com>
 <343a2bd3-38b7-7462-bc52-d3f6493bede0@lechnology.com>
 <YOrVy7Ba117s1maQ@shinobu>
From: David Lechner <david@lechnology.com>
Message-ID: <56fb48ac-335d-f112-6370-38ad35ad72f0@lechnology.com>
Date: Sun, 11 Jul 2021 09:05:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOrVy7Ba117s1maQ@shinobu>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - st-md-mailman.stormreply.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: kamel.bouhara@bootlin.com, gwendal@chromium.org, mcoquelin.stm32@gmail.com,
 linux-iio@vger.kernel.org, patrick.havelange@essensium.com,
 Pavel Machek <pavel@ucw.cz>, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, o.rempel@pengutronix.de,
 jarkko.nikula@linux.intel.com, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, fabrice.gasnier@st.com, syednwaris@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, jic23@kernel.org,
 alexandre.torgue@st.com
Subject: Re: [Linux-stm32] [PATCH v12 12/17] tools/counter: Create Counter
	tools
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

On 7/11/21 6:28 AM, William Breathitt Gray wrote:
> On Sat, Jul 10, 2021 at 11:53:35AM -0500, David Lechner wrote:
>> On 7/5/21 3:19 AM, William Breathitt Gray wrote:

>>> +	{
>>> +		/* Component data: Count 0 count */
>>> +		.component.type = COUNTER_COMPONENT_COUNT,
>>> +		.component.scope = COUNTER_SCOPE_COUNT,
>>> +		.component.parent = 0,
>>> +		/* Event type: Index */
>>> +		.event = COUNTER_EVENT_INDEX,
>>> +		/* Device event channel 0 */
>>> +		.channel = 0,
>>> +	},
>>> +	{
>>> +		/* Component data: Count 1 count */
>>> +		.component.type = COUNTER_COMPONENT_COUNT,
>>> +		.component.scope = COUNTER_SCOPE_COUNT,
>>> +		.component.parent = 1,
>>> +		/* Event type: Index */
>>> +		.event = COUNTER_EVENT_INDEX,
>>> +		/* Device event channel 0 */
>>> +		.channel = 0,
>>> +	},
>>> +};
>>> +
>>> +int main(void)
>>> +{
>>> +	int fd;
>>> +	int ret;
>>> +	struct counter_event event_data[2];
>>> +
>>> +	fd = open("/dev/counter0", O_RDWR);
>>> +	if (fd == -1) {
>>> +		perror("Unable to open /dev/counter0");
>>> +		return -errno;
>>
>> errno is no longer valid after calling perror(). Since this
>> is example code, we can just return 1 instead (exit codes
>> positive number between 0 and 255 so -1 would be 255).
> 
> Ack.
> 
>>> +	}
>>> +
>>> +	ret = ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches);
>>> +	if (ret == -1) {
>>> +		perror("Error adding watches[0]");
>>> +		return -errno;
>>> +	}
>>> +	ret = ioctl(fd, COUNTER_ADD_WATCH_IOCTL, watches + 1);
>>> +	if (ret == -1) {
>>> +		perror("Error adding watches[1]");
>>> +		return -errno;
>>> +	}
>>> +	ret = ioctl(fd, COUNTER_ENABLE_EVENTS_IOCTL);
>>> +	if (ret == -1) {
>>> +		perror("Error enabling events");
>>> +		return -errno;
>>> +	}
>>> +
>>> +	for (;;) {
>>> +		ret = read(fd, event_data, sizeof(event_data));
>>> +		if (ret == -1) {
>>> +			perror("Failed to read event data");
>>> +			return -errno;
>>> +		}
>>> +
>>> +		if (ret != sizeof(event_data)) {
>>> +			fprintf(stderr, "Failed to read event data\n");
>>> +			return -EIO;
>>> +		}
>>> +
>>> +		printf("Timestamp 0: %llu\tCount 0: %llu\n"
>>> +		       "Error Message 0: %s\n"
>>> +		       "Timestamp 1: %llu\tCount 1: %llu\n"
>>> +		       "Error Message 1: %s\n",
>>> +		       (unsigned long long)event_data[0].timestamp,
>>> +		       (unsigned long long)event_data[0].value,
>>> +		       strerror(event_data[0].status),
>>> +		       (unsigned long long)event_data[1].timestamp,
>>> +		       (unsigned long long)event_data[1].value,
>>> +		       strerror(event_data[1].status));
>>> +	}
>>
>> Aren't the Count 0 and Count 1 events independent? Why should we expect to
>> always get both events at the same time in the same order?
> 
> Watch 0 and Watch 1 are both triggered by the same event: a
> COUNTER_EVENT_INDEX event on device event channel 0. If we had set
> channel to 1 for Watch 1, then we would have two independent events, but
> in this case both Watches have their respective channel set to 0.

The thing that jumped out to me is that they have different parents.
But I guess I forgot that the event itself always has a scope of
device and that the component just says what value to record and
is otherwise independent of the event.

_______________________________________________
Linux-stm32 mailing list
Linux-stm32@st-md-mailman.stormreply.com
https://st-md-mailman.stormreply.com/mailman/listinfo/linux-stm32
